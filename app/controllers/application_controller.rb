class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

   private

   def require_login
     unless user_signed_in?
       flash[:alert] = "You must be logged in to access this section"
       redirect_to log_in_path # halts request cycle
     end
   end

   protected

   def configure_permitted_parameters
     added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
     devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
     devise_parameter_sanitizer.permit :account_update, keys: added_attrs
   end
end
