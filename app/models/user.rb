class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  # before_destroy :ensure_one
  before_save { self.email = email.downcase }

  validates :name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  has_secure_password

  private

  # def ensure_one
  #   if User.where(role: 'admin').count < 3
  #     return false
  #   else
  #     return true
  #   end
  # end
end
