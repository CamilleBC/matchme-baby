# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    nickname 'JDoe'
    firstname 'John'
    surname 'Doe'
    email 'john.doe@42.fr'
    password '0234@#kkjdfs@#'
  end

  factory :random_user, class: User do
    nickname { Faker::Internet.user_name }
    firstname { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8, 128, true, true) }
  end
end
