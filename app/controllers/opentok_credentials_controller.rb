class OpentokCredentialsController < ApplicationController
  def index
    render json: {
      api_key: Rails.application.secrets.opentok_api_key,
      api_secret: Rails.application.secrets.opentok_api_secret,
    }
  end
end
