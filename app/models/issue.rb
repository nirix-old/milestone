class Issue < ActiveRecord::Base
  validates :summary, presence: true
  validates :description, presence: true
  validates :project, presence: true
  validates :version, presence: true
  validates :type, presence: true
  validates :status, presence: true

  belongs_to :project
  belongs_to :user
  belongs_to :version
  belongs_to :type, class_name: :IssueType
  belongs_to :status, class_name: :IssueStatus

  scope :open,   -> { where(is_closed: false) }
  scope :closed, -> { where(is_closed: true) }
end
