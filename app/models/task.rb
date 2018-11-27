class Task < ApplicationRecord
  scope :in_desc, -> { order(created_at: :desc) }
end
