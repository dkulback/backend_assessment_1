class Api::ApplicationController < ApplicationController
  def ping
    render json: { "success": true }
  end
end
