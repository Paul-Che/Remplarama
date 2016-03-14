class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :has_practice, :email, :password,
      :password_confirmation, :address, :speciality, :numero_ordre, :numero_ursaff, :avatar,
       :presentation, :education, :publications, :convention, :house_visits, :secretary,
       :housing, :commission, :house_visits_tolerance, :nosecretary_tolerance, :nohousing_tolerance, :min_commission, :validated)
  end

#   def account_update_params
#     params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
#   end
end
