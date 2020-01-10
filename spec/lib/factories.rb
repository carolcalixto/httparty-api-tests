require "faker"
require_relative "../models/user_model"

FactoryBot.define do
    factory :user, class: UserModel do
        full_name { "Carol Calixto" }
        email { "ccalixto@gmail.com" }
        password { "pwd123" }

        after(:build) do |user|
            Database.new.delete_user(user.email)
        end
    end

    factory :user_registered, class: UserModel do
        id { 0 }
        full_name { Faker::TvShows::Friends.character }
        email { Faker::Internet.free_email(name: full_name) }
        password { "pwd123" }

        after(:build) do |user|
            Database.new.delete_user(user.email)
            result = ApiUser.save(user.to_hash)
            user.id = result.parsed_response["id"]
        end
    end

    factory :user_wrong_email, class: UserModel do
        full_name { "Carol Calixto" }
        email { "ccalixt#gmail.com" }
        password { "pwd123" }
    end

    factory :user_empty_name, class: UserModel do
        full_name { "" }
        email { "ccalixt@gmail.com" }
        password { "pwd123" }
    end

    factory :user_empty_email, class: UserModel do
        full_name { "Carol Calixto" }
        email { "" }
        password { "pwd123" }
    end

    factory :user_empty_password, class: UserModel do
        full_name { "Carol Calixto" }
        email { "ccalixt@gmail.com" }
        password { "" }
    end

    factory :user_null_name, class: UserModel do
        email { "ccalixt@gmail.com" }
        password { "pwd123" }
    end

    factory :user_null_email, class: UserModel do
        full_name { "Carol Calixto" }
        password { "pwd123" }
    end

    factory :user_null_password, class: UserModel do
        full_name { "Carol Calixto" }
        email { "ccalixt@gmail.com" }
    end



    
end