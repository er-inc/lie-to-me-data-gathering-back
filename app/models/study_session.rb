class StudySession < ApplicationRecord
  validates :friendly_id, presence: true

  enum status: {
    created: 'created',
    one_connection: 'one_connection',
    both_connections: 'both_connections',
    exchange_started: 'exchange_started',
    finished: 'finished'
  }
end
