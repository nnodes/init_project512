class RegistrationsController < Devise::RegistrationsController
  def new
    redirect_to unauthenticated_root_path, alert: t('devise.not_available')
  end

  def create
    redirect_to unauthenticated_root_path, alert: t('devise.not_available')
  end
end
