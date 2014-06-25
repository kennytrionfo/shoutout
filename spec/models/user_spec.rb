require 'rails_helper'

RSpec.describe User, :type => :model do

  describe 'validations' do
      it { should validate_presence_of :first_name }
      it { should validate_presence_of :last_name }
      it { should validate_presence_of :mood }
  end

  describe '.by_mood' do
    before do
      create(:user, first_name: 'Barbie', last_name: 'Doll', mood: 'happy')
      create(:user, first_name: 'Ken', last_name: 'Dude', mood: 'happy')
      create(:user, first_name: 'Buzz', last_name: 'Lightyear', mood: 'Hyper')
    end
    it 'Should find 2 happy users' do
      expect(User.by_mood('happy').count).to eq 2
    end
  end
end
