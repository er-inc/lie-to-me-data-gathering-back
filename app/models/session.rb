class Session < ApplicationRecord
  validates :code, :otk_session_id, :otk_token_id, presence: true
end