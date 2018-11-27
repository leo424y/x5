class Task < ApplicationRecord
  validates :content, presence: true

  scope :in_desc, -> { order(created_at: :desc) }
end
