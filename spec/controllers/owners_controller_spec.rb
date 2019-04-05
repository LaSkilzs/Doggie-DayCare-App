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
      it 'should succeessfully render an edit page' do
      get :show, params: { id: owner.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end
  end


    context 'POST #create' do
      let!(:owner) { FactoryBot.create :owner}

      it 'create a new owner' do
        params = {
          address: "178 Houston Rd",
          city: "Orange"
        }
      
      expect { post(:create, params: {owner: params})}.to change(Owner, :count).by(1)
      expect(flash[notice]).to eq 'Owner was successfully created.'
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
        expect(owner.attributes[key.to_s].to eq params[key])
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


end
end
