class User < ApplicationRecord
    has_many :games, dependent: :destroy
    has_secure_password

    before_save   :downcase_email

    # Validation
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: true

    validates :password, presence: true, length: { minimum: 6 }, 
                                        allow_nil: true


    # Converts email to all lowercase.
    def downcase_email
        self.email = email.downcase
    end
end