class Project < ApplicationRecord
  has_many :tasks
  has_rich_text :description
end
