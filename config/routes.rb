Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions"}

  get("/launchinfo", {:controller=>"launch_infos", :action=>"index"})
  root 'pc#home'

  get("/past-launchinfo", {:controller=>"launch_infos", :action=>"past"})
  get("/chat", {:controller=>"chat", :action=>"index"})
  get("/channels/:id", {:controller=>"chat", :action=>"channel"})
  get("/sendm", {:controller=>"chat", :action=>"sendm"})
  get("/sendn", {:controller=>"launch_infos", :action=>"sendn"})
  get("/messages/:id/delete", {:controller=>"chat", :action=>"deletem"})
  get("/users/:id/delete", {:controller=>"chat", :action=>"deleteu"})
  get("/contactus", {:controller=>"pc", :action=>"contactus"})
  get("/chat-tos", {:controller=>"chat", :action=>"tos"})
  get("/achat", {:controller=>"chat", :action=>"achat"})
  get("/adedit/:id", {:controller=>"chat", :action=>"ad_edit", as: "admin_edit"})
  get("/admin_update/:id", {:controller=>"chat", :action=>"admin_update", as: "admin_update"})
  get("/marsweather", {:controller=>"pc", :action=>"mw"})
  get("/nc", {:controller=>"pc", :action=>"nc"})
  get("/dc/:id/delete", {:controller=>"pc", :action=>"dc"})
  get("/ncc", {:controller=>"pc", :action=>"ncc"})
end
