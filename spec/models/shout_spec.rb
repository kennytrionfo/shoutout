require 'rails_helper'

RSpec.describe Shout, :type => :model do
  describe 'validations' do
    it { should validate_presence_of :message }
  end
end
