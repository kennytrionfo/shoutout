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

  describe '#new'  do
    it 'sets up a new user instance' do
      get :new
      expect(response).to be_success
      expect(assigns(:user)).to be_new_record
      expect(response).to render_template('new')
    end
  end

  describe '#create'  do
    context 'when saving a valid user' do
      it 'creates a new user and saves it to the db' do
        expect{
          post :create, user: {first_name: 'Dizzy', last_name: 'Wizzy', mood: 'crazy'}
        }.to change(User, :count).by(1)
      end
    end
    context 'when the user fails to save' do
      it 'fails to save to db' do
        post :create, user: {string: nil}
        expect(response).to render_template('new')
        expect(User.count).to eq 0
      end
    end
  end

  describe '#edit' do
    before do
      @user = create(:user)
    end
    it 'displays the note that I want to edit' do
      get :edit, id: @user.id
      expect(response).to be_success
      expect(assigns(:user).id).to eq @user.id
      expect(response).to render_template('edit')
    end
  end

  describe '#udpate' do

  end

  describe '#destroy' , :focus do
    before do
      @user = create(:user)
    end
    it 'removes the note from the database' do
       expect {
         delete :destroy, id: @user.id
       }.to change(User, :count).from(1).to(0)
       expect(response).to be_redirect
       expect(response).to redirect_to user_path
    end

  end

end
