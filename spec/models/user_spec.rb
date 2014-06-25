require 'rails_helper'

RSpec.describe User, :type => :model do

  describe 'validations' do
      it { should validate_presence_of :first_name }
      it { should validate_presence_of :last_name }
      it { should validate_presence_of :mood }
  end

  describe 'Find user by mood' do
    describe '.by_mood' do
      before do
        create(:user, first_name: 'Barbie', last_name: 'Doll', mood: 'Super Happy')
        create(:user, first_name: 'Ken', last_name: 'Dude', mood: 'Really Happy')
        create(:user, first_name: 'Buzz', last_name: 'Lighyear', mood: 'Hyper')
        end
    it 'Should find user by mood' do
      expect(User.by_mood('happy'))
    end

        end
      end



end
