class User < ApplicationRecord
    has_secure_password
    has_many :sessions, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    validates :password, presence: true, length: { minimum: 6 }

    scope :active, -> { where(active: true) }


    def token_expired?
        token_expiration_date&.past?
    end

    def token
        session = sessions.create!(token: SecureRandom.hex(64), expiration_date: Time.now + 4.hours)
        session.token
    end

    
end
