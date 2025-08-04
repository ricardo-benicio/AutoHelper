class Conversation < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :appointments, dependent: :destroy

  enum status: { active: 'active', completed: 'completed', cancelled: 'cancelled' }

  validates :urgency_level, inclusion: { in: 1..5 }
end
