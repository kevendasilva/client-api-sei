# frozen_string_literal: true

class Clients::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  respond_to :json

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name, :last_name, :telephone, :cpf
    ])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :name, :last_name, :telephone, :cpf
    ])
  end

  def resource_params
    params.require(:client).permit(:name, :last_name, :telephone, :cpf, :email, :password, :password_confirmation, :current_password)
  end
end
