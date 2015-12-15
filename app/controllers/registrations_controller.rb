class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :display_name, :bio, :location, :email, :password, :password_confirmation, :avatar)
  end
end
