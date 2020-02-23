require "open-uri"
require "json"
class LaunchInfosController < ApplicationController
  def index
    @data = open("https://launchlibrary.net/1.4/launch/next/15").read
    @launches = JSON.parse(@data)["launches"]
    @launch_infos = LaunchInfo.order(:date_time => :asc)
    @title = "Upcoming Launches"
    render('index.html.erb')
  end
  def past
    start_date = (Date.today - 1.month).strftime("%Y-%m-%d")
  end_date = (Date.today).strftime("%Y-%m-%d")
    @data = open("https://launchlibrary.net/1.4/launch?startdate=#{start_date}&enddate=#{end_date}").read
    @launches = JSON.parse(@data)["launches"]
    @launch_infos = LaunchInfo.order(:date_time => :asc)
    @title = "Past Launches"
    render('index.html.erb')
  end
  def sendn
    message = Message.new
    message.user_id = current_user.id
    message.text = params["message"]
    message.launch = params["launch"]
    message.save
    respond_to do |format|
        format.html {redirect_back(fallback_location: "/launchinfo/")}
      format.js
    end
  end
end
