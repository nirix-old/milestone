class User < ActiveRecord::Base
  attr_accessible :username, :email, :name, :password, :password_confirmation, :password_digest
  has_secure_password

  validates :username, :password_confirmation, :email, :name, presence: true
  validates :username, :email, uniqueness: { case_sensitive: false }, on: :create
  validates :password_digest, confirmation: true
end
