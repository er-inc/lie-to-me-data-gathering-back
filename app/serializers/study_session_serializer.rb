class StudySessionSerializer < ActiveModel::Serializer
  attributes :id, :interviewer, :interviewed, :lies, :otk_session_id, :otk_token_interviewer,
             :otk_token_interviewed
end
