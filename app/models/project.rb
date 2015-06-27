class Project < ActiveRecord::Base
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  has_many :issues
  has_many :versions
end
