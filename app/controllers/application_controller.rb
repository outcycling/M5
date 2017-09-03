class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    
     before_filter :configure_permitted_parameters, if: :devise_controller?
    
    def after_sign_in_path_for(resource)
        new_gratitude_path 
    end
    
    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit( :password_confirmation, :name, :email, :password, :current_password, :birthdate, :zip) }
        end
    
end

    
    

