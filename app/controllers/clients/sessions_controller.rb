# frozen_string_literal: true

class Clients::SessionsController < Devise::SessionsController
  respond_to :json
end
