class StudySession < ApplicationRecord
  validate :friendly_id, presence: true

  enum status: {
    created: 'created',
    one_connection: 'one_connection',
    both_connections: 'both_connections',
    exchange_started: 'exchange_started',
    finished: 'finished'
  }

  def next_status
    statuses[statuses.keys.index(status.to_sym) + 1]
  end
end
