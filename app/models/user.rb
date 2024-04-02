class User < ApplicationRecord
    include ActiveModel::SecurePassword
    has_secure_password
    has_many :candidates
end
