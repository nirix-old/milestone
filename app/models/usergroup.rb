class Usergroup < ActiveRecord::Base
  has_many :users

  def is_admin?
    is_admin
  end
end
