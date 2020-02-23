# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  private
   def check_captcha
     unless verify_recaptcha
       self.resource = resource_class.new sign_up_params
       resource.validate # Look for any other validation errors besides Recaptcha
       set_minimum_password_length
      render "users/registrations/new"
     end
   end
end
