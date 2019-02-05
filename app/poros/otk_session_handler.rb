class OtkSessionHandler
  require 'opentok'

  def new_connection(study_session)
    return update_status(study_session) if study_session.otk_session_id.present?
    otk_session = opentok.create_session
    study_session.update(
      otk_session_id: otk_session.session_id,
      otk_token_interviewer: otk_session.generate_token,
      otk_token_interviewed: otk_session.generate_token,
      lies: [true, false].sample,
      status: 'one_connection'
    )
  end

  def begin_exchange(study_session)
    archive = opentok.archives.create(
      study_session.otk_session_id,
      name: "#{study_session.interviewer}-#{study_session.interviewed}-#{date}"
    )
    study_session.update(status: 'exchange_started', archive_id: archive.id)
  end

  def end_exchange(study_session)
    archive = opentok.archives.find(study_session.archive_id)
    archive.stop
    study_session.update(status: 'finished', file_url: archive.url)
  end

  private

  def update_status(study_session)
    study_session.update(status: 'both_connections')
  end

  def opentok
    @opentok ||= OpenTok::OpenTok.new(
      Rails.application.secrets.opentok_api_key,
      Rails.application.secrets.opentok_api_secret
    )
  end
end
