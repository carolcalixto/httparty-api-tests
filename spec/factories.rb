require_relative "models/user_model"

FactoryBot.define do
    factory :user, class: UserModel do
        full_name { "Caroline Calixto" }
        email { "ccalixto@gmail.com" }
        password { "pwd123" }

        after(:build) do |user|
            Database.new.delete_user(user.email)
        end
    end

    factory :user_wrong_email, class: UserModel do
        full_name { "Caroline Calixto" }
        email { "ccalixt#gmail.com" }
        password { "pwd123" }

    end
    
end