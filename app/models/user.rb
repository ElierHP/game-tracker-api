class User < ApplicationRecord
    has_many :games, dependent: :destroy
    has_secure_password
end
