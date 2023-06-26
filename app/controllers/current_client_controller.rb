class CurrentClientController < ApplicationController
  def index
    render json: current_client, status: :ok
  end
end
