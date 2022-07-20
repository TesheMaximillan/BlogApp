class ApplicationController < ActionController::Base
  before_action :configure_devise_params, if: :devise_controller?
  layout :layout_by_resource

  private

  def layout_by_resource
    devise_controller? ? 'session' : 'application'
  end

  protected

  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[
                                        name
                                        email
                                        password
                                        password_confirmation
                                      ])
  end
end
