require 'rails_helper'

RSpec.describe OwnersController, type: :controller do

  describe 'Owner controller request specs' do
    context 'GET #index' do
      it 'should succeessfully render an index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end

    context 'GET #show' do
      let!(:owner) { create :owner}
      it 'should succeessfully render an showpage' do
      get :show, params: { id: owner.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

    describe 'POST #create' do
      context 'with valid parameters' do
      let!(:owner) {FactoryBot.create :owner}
      let!(:valid_params) do 
        { address: owner.address, city: owner.city, user_id: owner.user_id}
      end

      it 'creates new owner' do
      expect { post(:create, params: { owner: valid_params}) }.to change(Owner, :count).by(1)
      expect(flash[:notice]).to eq "Owner was created"
      
      end
    end
  end

    context 'PUT #update' do
      let!(:owner) { create :owner}

      it 'should update owner info' do
      params = {
        address: "2100 Jackson Street",
        city: "Detroit"
      }
      put :update, params: {id: owner.id, owner: params}
      owner.reload
      params.keys.each do |key|
        expect(owner.attributes[key.to_s]).to eq(params[key])
      end
    end
  end

    context 'DELETE #destroy' do
      let!(:owner) { create :owner}
      it 'should delete owner' do
     expect { delete :destroy, params: {id: owner.id}}.to change(Owner, :count).by(-1)
     expect(flash[:notice]).to eq 'Owner was successfully deleted'
    end
  end

  context 'Routing' do 
    it 'routes to #index' do
    expect(get: '/owners').to route_to('owners#index')
    end

    it 'routes to #show' do
    expect(get: '/owners/1').to route_to('owners#show', id: '1')
    end

    it 'routes to #new' do
    expect(get: '/owners/new').to route_to('owners#new')
    end
    
    it 'routes to #create' do
    expect(post: '/owners').to route_to('owners#create')
    end
  
    it 'routes to #update via PUT' do
    expect(put: '/owners/1').to route_to('owners#update', id: '1')
    end
    
    it 'routes to #destroy via DELETE' do
    expect(delete: '/owners/1').to route_to('owners#destroy', id: '1')
    end
  end


end
end


