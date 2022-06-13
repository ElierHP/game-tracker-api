class Game < ApplicationRecord
    belongs_to :user

    # Validations
    validates :title, presence: true, length: { minimum: 2, maximum: 40 }
    validates :owned, inclusion: [true, false]
    validates :platform, presence: true, length: { minimum: 2, maximum: 40 }
end
