class StudySessionsController < ApplicationController
  def connect
    study_session = StudySession.where(friendly_id: params[:friendly_id])
    session_handler.new_connection(study_session)
    render json: study_session
  end

  def begin
    session_handler.begin_exchange(study_session)
    head :ok
  end

  def finish
    session_handler.end_exchange(study_session)
    head :ok
  end

  def guess
    study_session.update(guess: params[:guess].to_bool)
    head :ok
  end

  private

  def study_session
    @study_session ||= StudySession.find(params[:id])
  end

  def session_handler
    OtkSessionHandler.new
  end
end
