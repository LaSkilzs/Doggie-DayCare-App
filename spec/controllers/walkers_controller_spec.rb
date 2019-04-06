require 'rails_helper'

RSpec.describe WalkersController, type: :controller do
  describe 'walker controller request specs' do
    context 'GET #index' do
      it 'should succeessfully render an index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end

    context 'GET #show' do
      let!(:walker) { create :walker}
      it 'should succeessfully render an showpage' do
      get :show, params: { id: walker.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

    describe 'POST #create' do
      context 'with valid parameters' do
      let!(:walker) {FactoryBot.create :walker}
        let!(:valid_params) do 
          { age: walker.age, experience: walker.experience, own_dog: walker.own_dog, rating: walker.rating, user_id: walker.user_id}
        end

          it 'creates new walker' do
          expect { post(:create, params: { walker: valid_params}) }.to change(Walker, :count).by(0)
          expect(flash[:notice]).to eq "walker was created"
          end
      end
    end

    context 'PUT #update' do
      let!(:walker) { create :walker}

      it 'should update walker info' do
      params = {
        age: walker.age,
        experience: walker.experience,
        own_dog: walker.own_dog,
        rating: walker.rating,
        user_id: walker.user_id
      }
      put :update, params: {id: walker.id, walker: params}
      walker.reload
      params.keys.each do |key|
        expect(walker.attributes[key.to_s]).to eq(params[key])
      end
    end
  end

    context 'DELETE #destroy' do
      let!(:walker) { create :walker}
      it 'should delete walker' do
     expect { delete :destroy, params: {id: walker.id}}.to change(Walker, :count).by(-1)
     expect(flash[:notice]).to eq 'walker was successfully deleted'
    end
  end

  context 'Routing' do 
    it 'routes to #index' do
    expect(get: '/walkers').to route_to('walkers#index')
    end

    it 'routes to #show' do
    expect(get: '/walkers/1').to route_to('walkers#show', id: '1')
    end

    it 'routes to #new' do
    expect(get: '/walkers/new').to route_to('walkers#new')
    end
    
    it 'routes to #create' do
    expect(post: '/walkers').to route_to('walkers#create')
    end
  
    it 'routes to #update via PUT' do
    expect(put: '/walkers/1').to route_to('walkers#update', id: '1')
    end
    
    it 'routes to #destroy via DELETE' do
    expect(delete: '/walkers/1').to route_to('walkers#destroy', id: '1')
    end
  end


end
end
