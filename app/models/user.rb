class User < ApplicationRecord
    devise :database_authenticatable, :registerable
    
    has_many :conversations, dependent: :destroy
    has_many :appointments, through: :conversations
end

