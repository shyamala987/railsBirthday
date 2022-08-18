require 'bcrypt'
class User < ApplicationRecord

    include BCrypt
    validates :password, presence: true, confirmation: true, length: { in: 6..15 }
    validates :email, presence: true, uniqueness: true

    attr_accessor :password
    before_save :encrypt_password

    def self.authenticate(email, password)
        user = find_by_email(email)
        if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
            puts "Valid user :)"
            user
        else
            puts "NOT a valid user!"
            nil
        end
    end

    def encrypt_password
        if password.present?
            self.password_salt = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end
    end
end
