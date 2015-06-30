class IssueStatus < ActiveRecord::Base
  validates :name, presence: true
end
