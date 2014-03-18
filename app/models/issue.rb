class Issue < ActiveRecord::Base
  scope :open,   -> { where(is_closed: false) }
  scope :closed, -> { where(is_closed: true) }
end
