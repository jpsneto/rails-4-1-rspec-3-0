require 'rails_helper'

describe Role do
  it "has a valid factory" do
    # user_manager = create(:manager_user)
    # puts user_manager.name
    # puts user_manager.activities.count
    expect(build(:manage_user)).to be_valid
  end

  it "is invalid without a activitiy" do
    role_without_activity = build(:role_without_activity)
    role_without_activity.valid?
    expect(role_without_activity.errors[:activities]).to include("can't be blank")
  end

  it "has five activities" do

  end

end