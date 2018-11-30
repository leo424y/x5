class Task < ApplicationRecord
  belongs_to :user

  include AASM

  aasm column: :state do
    state :todo, initial: true
    state :doing, :done
  end


  validates :content, presence: true

  scope :in_desc, -> { order(created_at: :desc) }
  scope :in_end_time_desc, -> { order(end_time: :desc) }
  scope :in_priority_desc, -> { order(priority: :desc) }
  scope :in_priority_asc, -> { order(priority: :asc) }
end


