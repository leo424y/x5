class Task < ApplicationRecord
  belongs_to :user

  has_many :taggings
  has_many :tags, through: :taggings
  
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

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end
  
  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).tasks
  end
end


