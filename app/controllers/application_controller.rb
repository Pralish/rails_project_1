class ApplicationController < ActionController::Base
     include Pundit

     protect_from_forgery with: :null_session

     before_action :configure_permitted_parameters, if: :devise_controller?

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :avatar)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :role, :avatar)}
          end

end
