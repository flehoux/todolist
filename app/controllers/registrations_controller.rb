class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(user)
    projects_path
  end

  def delete_photo
    current_user.photo = nil
    current_user.save

    redirect_to edit_user_registration_path
  end
 
  private
 
    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
   
    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :email, :photo, :password, :password_confirmation, :current_password)
    end
end