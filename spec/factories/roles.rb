FactoryGirl.define do
  factory :manage_user, class: Role do
    #sequence(:name) {|n| "role #{n}"}
    name 'Manage User'
    #activities {|a| [a.association(:user_index)]}

    after(:build) do |role|
      [:user_index, :user_show, :user_create, :user_update, :user_destroy].each do |activity|
        role.activities << FactoryGirl.create(activity)
      end
    end

    # factory :invalid_contact do
    #   firstname nil
    # end
  end


  factory :role_without_activity, class: Role do
    name 'Manage User'
  end

end
