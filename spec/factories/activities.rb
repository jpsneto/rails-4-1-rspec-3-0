FactoryGirl.define do
  factory :user_activity, class: Activity do
    resource 'user'

    factory :user_index do
      activity 'index'
    end

    factory :user_show do
      activity 'show'
    end

    factory :user_create do
      activity 'create'
    end

    factory :user_update do
      activity 'update'
    end

    factory :user_destroy do
      activity 'destroy'
    end
  end

end
