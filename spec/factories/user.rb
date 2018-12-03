FactoryBot.define do
  factory :user, class: User do
    name { 'Leo' }
    password { 'y' }
    password_confirmation { 'y' }
    email { 'l@l' }
    role { 'admin' }
  end

  factory :user2, class: User do
    name { 'Fly' }
    password { 'y' }
    password_confirmation { 'y' }
    email { 'ly@ly' }
    role { 'normal' }
  end
end