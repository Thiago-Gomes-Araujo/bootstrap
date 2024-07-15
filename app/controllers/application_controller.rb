class ApplicationController < ActionController::Base

  include Pagy::Backend

    layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      'devise_layout' # Layout específico para a página de login
    else
      'application' # Layout padrão para outras páginas
    end
  end
end
