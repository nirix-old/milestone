class IssueType < ActiveRecord::Base
  validates :name, presence: true
end
