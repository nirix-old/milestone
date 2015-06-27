class Issue < ActiveRecord::Base
  validates :summary, presence: true
  validates :description, presence: true

  belongs_to :project
  belongs_to :user

  scope :open,   -> { where(is_closed: false) }
  scope :closed, -> { where(is_closed: true) }
end
