class Session < ApplicationRecord
    belongs_to :user


    def expiration?
        expiration_date.past?
    end
end
