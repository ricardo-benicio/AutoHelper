class Appointment < ApplicationRecord
  belongs_to :conversation
  belongs_to :workshop

  enum status: { pending: 'pending', confirmed: 'confirmed', cancelled: 'cancelled' }
  
  validates :datetime, presence: true
  validates :datetime_in_future

  private

  def datetime_in_future
    return if datetime.present?
    errors.add(:datetime, "must be in the future") if datetime < Time.current
  end
end

