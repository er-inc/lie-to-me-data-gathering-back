class SessionsController < ApiController
  def by_code
    render json: Session.find_by!(code: params[:code]), status: :ok
  end
end