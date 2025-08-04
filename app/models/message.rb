class Message < ApplicationRecord
  belongs_to :conversation

  enum sender_type: { user: 'user', ai: 'ai' }

  scope :ai_responses, -> { where(ai_response: true) }
  scope :user_messages, -> { where(ai_response: false) }
end
