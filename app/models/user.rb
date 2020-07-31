class User < ApplicationRecord
    has_secure_password
    validate :username_validator
    validates :password_confirmation, presence: true
    validate :password_complexity

    def password_complexity
        # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
        return if password.blank? || password =~ /\A(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}\z/
    
        errors.add :password, 'Complexity requirement not met. Length should be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
    end

    def username_validator
        return if username.blank? || username =~ /\A[a-zA-Z0-9].{3,20}\z/
        errors.add :username, "requirements not met. Length should be 3-20 characters and can only include alphanumeric characters and underscores"
    end

end
