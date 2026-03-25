class Task < ApplicationRecord
  belongs_to :project
  has_rich_text :description

  enum :priority, { low: 1, medium: 2, high: 3 }

  scope :complete, -> { where(complete: true) }
  scope :incomplete, -> { where(complete: false) }
end
