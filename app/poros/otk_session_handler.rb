class OtkSessionHandler
  require 'opentok'

  def new_connection(study_session)
    return if study_session.otk_session_id.present?
    otk_session = opentok.create_session
    study_session.update(
      otk_session_id: otk_session.session_id,
      interviewer: otk_session.generate_token,
      interviewed: otk_session.generate_token,
      lies: [true, false].sample,
      status: study_session.next_status
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

  def opentok
    @opentok ||= OpenTok::OpenTok.new(
      Rails.application.secrets.opentok_api_key,
      Rails.applitacion.secrets.opentok_api_key
    )
  end
end
