class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  validates :email, presence: true, length: {maximum: 100},
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  has_secure_password
end
