class Message < ApplicationRecord
  validates :body, presence: true

  after_create_commit { broadcast_append_to "messages" }
  after_destroy_commit { broadcast_remove _to "messages" }
end
