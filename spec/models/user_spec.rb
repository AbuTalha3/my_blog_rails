require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name and a valid posts_counter' do
    user = User.new(name: "Abu", posts_counter: 0)
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(posts_counter: 0)
    expect(user).not_to be_valid
  end
end
