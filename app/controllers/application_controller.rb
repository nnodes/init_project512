class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  load_and_authorize_resource unless: :invalid_controller?

  private

  def invalid_controller?
    params[:controller] == 'home' ||
    devise_controller?
  end

  def current_ability
    # I am sure there is a slicker way to capture the controller namespace
    controller_name_segments = params[:controller].split('/')
    controller_name_segments.pop
    controller_namespace = controller_name_segments.join('/').camelize
    Ability.new(current_user, controller_namespace)
  end

  rescue_from CanCan::AccessDenied do
    if user_signed_in?
      redirect_to main_app.authenticated_root_path, alert: 'No tiene permiso para realizar esta acción.'
    else
      redirect_to main_app.unauthenticated_root_path, alert: 'No tiene permiso para realizar esta acción.'
    end
  end
end
