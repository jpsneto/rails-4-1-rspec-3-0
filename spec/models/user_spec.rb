require 'rspec'

describe User do

  it 'do not create a use without email' do


    expect(user.erros).to include("password can't blank")
  end
end