require 'rails_helper'

RSpec.describe DogsController, type: :controller do
   describe 'dog controller request specs' do
    context 'GET #index' do
      it 'should succeessfully render an index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end

    context 'GET #show' do
      let!(:dog) { create :dog}
      it 'should succeessfully render an showpage' do
      get :show, params: { id: dog.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

    describe 'POST #create' do
      context 'with valid parameters' do
      let!(:dog) {FactoryBot.create :dog}
        let!(:valid_params) do 
          {  name: dog.name,
             age: dog.age,
             breed: dog.breed,
             size: dog.size,
             restrictions: dog.restrictions,
             friendliness: dog.friendliness,
             image: dog.image,
             owner_id: dog.owner_id}
        end

          it 'creates new dog' do
          expect { post(:create, params: { dog: valid_params}) }.to change(Dog, :count).by(0)
          expect(flash[:notice]).to eq "dog was created"
          end
      end
    end

    context 'PUT #update' do
      let!(:dog) { create :dog}

      it 'should update dog info' do
      params = {
        name: dog.name,
        age: dog.age,
        breed: dog.breed,
        size: dog.size,
        restrictions: dog.restrictions,
        friendliness: dog.friendliness,
        image: dog.image,
        owner_id: dog.owner_id
      }
      put :update, params: {id: dog.id, dog: params}
      dog.reload
      params.keys.each do |key|
        expect(dog.attributes[key.to_s]).to eq(params[key])
      end
    end
  end

    context 'DELETE #destroy' do
      let!(:dog) { create :dog}
      it 'should delete dog' do
     expect { delete :destroy, params: {id: dog.id}}.to change(Dog, :count).by(-1)
     expect(flash[:notice]).to eq 'dog was successfully deleted'
    end
  end

  context 'Routing' do 
    it 'routes to #index' do
    expect(get: '/dogs').to route_to('dogs#index')
    end

    it 'routes to #show' do
    expect(get: '/dogs/1').to route_to('dogs#show', id: '1')
    end

    it 'routes to #new' do
    expect(get: '/dogs/new').to route_to('dogs#new')
    end
    
    it 'routes to #create' do
    expect(post: '/dogs').to route_to('dogs#create')
    end
  
    it 'routes to #update via PUT' do
    expect(put: '/dogs/1').to route_to('dogs#update', id: '1')
    end
    
    it 'routes to #destroy via DELETE' do
    expect(delete: '/dogs/1').to route_to('dogs#destroy', id: '1')
    end
  end

end
end
