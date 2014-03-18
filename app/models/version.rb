class Version < ActiveRecord::Base
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  validates :status, presence: true

  belongs_to :project
  has_many   :issues
end
