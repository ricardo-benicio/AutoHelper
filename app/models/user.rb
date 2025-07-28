class User < ApplicationRecord
    has_many :conversations, dependent: :destroy
    has_many :appointments, through: :conversations
end

