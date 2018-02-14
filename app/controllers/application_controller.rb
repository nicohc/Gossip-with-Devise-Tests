class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

before_action :sanitize_devise_params, if: :devise_controller?

#Pour voir la solution trouvée pour créer une restriction à l'entrée
#https://stackoverflow.com/questions/28787615/add-invite-code-to-devise
  protected

  def sanitize_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:anonymous_username, :secret_code])
  end

end
