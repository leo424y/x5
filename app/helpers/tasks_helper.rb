module TasksHelper
  def tag_links(tags)
    tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(", ") 
  end

  def all_user_tags
    user_tag = []
    current_user.tasks.includes(:tags).each do |task| 
      user_tag += task.tags.map(&:name)
    end
    user_tag.uniq.sort.join(", ")
  end
end
