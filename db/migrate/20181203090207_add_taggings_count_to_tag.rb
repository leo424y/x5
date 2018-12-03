class AddTaggingsCountToTag < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :taggings_count, :integer, default: 0

    Tag.pluck(:id).each do |i|
      Tag.reset_counters(i, :taggings) # 全部重算一次
    end
  end
end
