require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe '#index' do
    before do
      @users = create_list(:user, 5)
    end
    it 'displays a collection of users' do
      get :index
      expect(response).to be_success
      expect(assigns(:users).count).to eq 5
    end
  end

  describe '#show'  do
    before do
      @user = create(:user, first_name: "Buzz")
    end

    it 'shows one user & render the show template' do
      get :show, id: @user.id
      expect(response).to be_success
      expect(assigns(:user).first_name).to eq "Buzz"
      expect(response).to render_template('show')
    end
  end

  describe '#new' , :focus do
    it 'sets up a new user instance' do
      
    end
  end

  describe '#create' do

  end

  describe '#edit' do

  end

  describe '#udpate' do

  end

  describe '#destroy' do

  end



end
