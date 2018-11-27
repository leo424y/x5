class Task < ApplicationRecord
  validates :content, presence: true

  scope :in_desc, -> { order(created_at: :desc) }
  scope :in_end_time_desc, -> { order(end_time: :desc) }
end
