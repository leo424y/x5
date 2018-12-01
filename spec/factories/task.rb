FactoryBot.define do
  factory :task, class: Task do
    content 'Leo task'
    all_tags 'a, b, c'
    user_id '1'
  end

  factory :task2, class: Task do
    content 'Leo task 2'
    all_tags 'b, c, d'
    user_id '1'
  end
end