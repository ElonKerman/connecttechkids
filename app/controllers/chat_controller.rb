require "open-uri"
require "json"
class ChatController < ApplicationController
  def index
    @channels = Channel.all

    redirect_to("/channels/#{@channels.first.id}")
  end
  def channel
    if current_user.blank?
      redirect_to("/", :notice => "You must login to access the chat feature of connectspacekids.")
    else
      @channels = Channel.all
      @channel = Channel.find(params["id"])
      @messages = Message.where(:channel_id => @channel.id)
      respond_to do |format|
        format.html {render('index.html.erb')}
        format.json {
          render json: @messages, include: :user
        }
      end
    end
  end
  def sendm
    message = Message.new
    message.user_id = current_user.id
    message.text = params["message"]
    message.channel_id = params["channel_id"]
    message.save
    respond_to do |format|
      format.html {redirect_to("/channels/#{message.channel_id}")}
      format.js
    end
  end
  def deletem
    message = Message.find(params["id"])
     if current_user.admin || current_user.mod
      message.destroy
    end
    redirect_to("/channels/#{message.channel_id}")
  end
  def deleteu
    user = User.find(params["id"])
    if current_user.admin
      user.destroy
    end
    redirect_back(:fallback_location => "/")
  end
  def tos
    if current_user.blank?
      redirect_to("/")
    elsif current_user.accepted_chat_tos == nil
      render('tos.html.erb')
    else
      redirect_to("/chat")
    end
  end
  def achat
    user = current_user
    user.accepted_chat_tos = true
    user.save
    redirect_to("/chat")
  end
  def ad_edit
    if current_user.admin != true
      redirect_to("/", :notice => "Stop hacking you might be banned, #{current_user.username}")
    else
      @user = User.find(params["id"])
      render("users/admin_edit.html.erb")
    end

  end
  def admin_update
    if current_user.admin != true
      redirect_to("/", :notice => "Stop hacking you might be banned, #{current_user.username}")
    else
      @user = User.find(params["id"])
      @user.username = params["username"]
      @user.email = params["email"]
      @user.mod = params["mod"]
      @user.confirmed_at = params["confirmed_at"]
      @user.save
      redirect_to("/chat", :notice => "it worked")
    end
  end
end
