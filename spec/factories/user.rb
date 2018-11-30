FactoryBot.define do
  factory :user, class: User do
    name 'Leo'
    password 'y'
    password_confirmation 'y'
    email 'l@l'
  end
end