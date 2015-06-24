class User < ActiveRecord::Base
  has_secure_password

  validates :username, uniqueness: { case_sensitive: false }, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }

  belongs_to :usergroup

  def is_admin?
    usergroup.is_admin?
  end
end
