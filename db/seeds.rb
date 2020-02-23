Channel.destroy_all
c1 = Channel.new
c1.name = "general"
c1.info = "Chat about anything space/new discoveries"
c1.save
c2 = Channel.new
c2.name = "spacex"
c2.info = "About anything Spacex and Elon Musk"
c2.save
