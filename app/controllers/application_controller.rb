class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  include Pundit

  after_action :verify_authorized, except: :index, unless: :devise_or_admin_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_or_admin_controller?


  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = "Vous n'êtes pas autorisé(e) à effectuer cette action."
    redirect_to(root_path)
  end


  def devise_or_admin_controller?
    devise_controller? || params[:controller] =~ /admin\/.*/
  end

  def disable_footer
  @disable_footer = true
  end

  def default_url_options
    { host: ENV['HOST'] || 'localhost:3000' }
  end

  # Mailboxer :
  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Ressource non-trouvée.'
    redirect_back_or root_path
  end
  # Mailboxer :
  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) << :first_name
   end
end
