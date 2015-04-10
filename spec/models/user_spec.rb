require 'rails_helper'

describe User do
  it 'is invalid without email' do
    user = User.new(password: 'secret123')
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
end