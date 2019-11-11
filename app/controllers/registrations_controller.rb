class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, if: :devise_controller?

    private 
    def configure_sign_up_params
        # params.require(:user).permit(:name, :email, :password, :password_confirmation)
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    def account_update_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
    end
end