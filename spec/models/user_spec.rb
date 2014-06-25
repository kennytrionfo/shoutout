require 'rails_helper'

RSpec.describe User, :type => :model do

  describe 'validations' do
      it { should validate_presence_of :first_name }
      it { should validate_presence_of :last_name }
  end

  describe 'Find user by mood' do
    it 'Should find user by mood' do
      expect(User.find)

end