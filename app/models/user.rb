class User < ApplicationRecord
  has_many :tasks

  before_save { self.email = email.downcase }
  validates :name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  has_secure_password
end
