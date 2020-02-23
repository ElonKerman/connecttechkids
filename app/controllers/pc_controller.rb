class PcController < ApplicationController

  def home


    response = Unirest.get("https://api.nasa.gov/planetary/apod?api_key=#{ENV["NASA_API_KEY"]}")
    @imghdurl =  response.body["hdurl"]
    @imgurl =  response.body["url"]



  end

  def contactus

  end

  def nc

  end

  def dc
    channel = Channel.find(params["id"])
      if current_user.admin || current_user.mod
        channel.destroy
      end
    redirect_to('/chat')
  end

  def ncc
    nc = Channel.new
    nc.name = params["channel-name"]
    nc.save
    redirect_to('/chat')
  end


  def mw
    render('mars.html.erb')
  end

end
