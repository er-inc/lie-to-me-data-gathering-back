class TokensController < ApplicationController
  def show
    byebug
    render json: token, status: :ok
  end

  private

  def token
    @token ||= Token.find_by(friendly_id: params[:friendly_id])
  end
end
