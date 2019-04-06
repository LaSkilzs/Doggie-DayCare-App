require 'rails_helper'

RSpec.describe UsersController, type: :controller do
describe 'User controller request specs' do
    context 'GET #index' do
      it 'should succeessfully render an index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end

    context 'GET #show' do
      let!(:user) { create :user}
      it 'should succeessfully render an showpage' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

    describe 'POST #create' do
      context 'with valid parameters' do
      let!(:user) {FactoryBot.create :user}
      let!(:valid_params) do 
        { username: user.username, name: user.name, email: user.email, role: user.role, password: user.password_digest}
      end
      it 'creates new user' do
  
      expect { post(:create, params: { user: valid_params}) }.to change(User, :count).by(0)
      expect(flash[:notice]).to eq "User was created"
      
      end
    end
  end

    context 'PUT #update' do
      let!(:user) { create :user}

      it 'should update user info' do
      params = {
        username: "Checker",
        email: user.email,
        name: user.name,
        role: user.role,
        password: user.password,
      }
      put :update, params: {id: user.id, user: params}
      user.reload
      params.keys.each do |key|
        expect(user.attributes[key.to_s]).to eq(params[key])
      end
    end
  end

    context 'DELETE #destroy' do
      let!(:user) { create :user}
      it 'should delete user' do
     expect { delete :destroy, params: {id: user.id}}.to change(User, :count).by(-1)
     expect(flash[:notice]).to eq 'User was successfully deleted'
    end
  end

  context 'Routing' do 
    it 'routes to #index' do
    expect(get: '/users').to route_to('users#index')
    end

    it 'routes to #show' do
    expect(get: '/users/1').to route_to('users#show', id: '1')
    end

    it 'routes to #new' do
    expect(get: '/users/new').to route_to('users#new')
    end
    
    it 'routes to #create' do
    expect(post: '/users').to route_to('users#create')
    end
  
    it 'routes to #update via PUT' do
    expect(put: '/users/1').to route_to('users#update', id: '1')
    end
    
    it 'routes to #destroy via DELETE' do
    expect(delete: '/users/1').to route_to('users#destroy', id: '1')
    end
  end
end
end
