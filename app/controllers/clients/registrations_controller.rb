# frozen_string_literal: true

class Clients::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  respond_to :json

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    if resource.update(account_update_params)
      render json: {
        message: 'Successfully updated.',
        data: resource
      }, status: :ok
    else
      render json: {
        message: "Client couldn't be successfully updated. #{resource.errors.full_messages.to_sentence}"
      }, status: :unprocessable_entity
    end
  end

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        message: 'Signed up sucessfully.',
        data: resource
      }
    else
      render json: {
        message: "Client couldn't be created successfully. #{resource.errors.full_messages.to_sentence}"
      }, status: :unprocessable_entity
    end
  end

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
