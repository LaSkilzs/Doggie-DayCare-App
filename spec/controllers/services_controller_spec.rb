require 'rails_helper'

RSpec.describe ServicesController, type: :controller do
  describe 'service controller request specs' do
    context 'GET #index' do
      it 'should succeessfully render an index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end

    context 'GET #show' do
      let!(:service) { create :service}
      it 'should succeessfully render an showpage' do
      get :show, params: { id: service.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

    describe 'POST #create' do
      context 'with valid parameters' do
      let!(:service) {FactoryBot.create :service}
        let!(:valid_params) do 
          { name: service.name, bundle: service.bundle,package: service.package,
            category: service.category, max_time: service.max_time, pkg_amount: service['pkg_amount'],  hourly_rate: service.hourly_rate}
        end

          it 'creates new service' do
          expect { post(:create, params: { service: valid_params}) }.to change(Service, :count).by(0)
          expect(flash[:notice]).to eq "service was created"
          end
      end
    end

    context 'PUT #update' do
      let!(:service) { create :service}

      it 'should update service info' do
      params = {
        name: service.name, 
        bundle: service.bundle,
        package: service.package,
        category: service.category, 
        max_time: service.max_time, 
        pkg_amount: service['pkg_amount'], 
        hourly_rate: service.hourly_rate
      }
      put :update, params: {id: service.id, service: params}
      service.reload
      params.keys.each do |key|
        expect(service.attributes[key.to_s]).to eq(params[key])
      end
    end
  end

    context 'DELETE #destroy' do
      let!(:service) { create :service}
      it 'should delete service' do
     expect { delete :destroy, params: {id: service.id}}.to change(Service, :count).by(-1)
     expect(flash[:notice]).to eq 'service was successfully deleted'
    end
  end

  context 'Routing' do 
    it 'routes to #index' do
    expect(get: '/services').to route_to('services#index')
    end

    it 'routes to #show' do
    expect(get: '/services/1').to route_to('services#show', id: '1')
    end

    it 'routes to #new' do
    expect(get: '/services/new').to route_to('services#new')
    end
    
    it 'routes to #create' do
    expect(post: '/services').to route_to('services#create')
    end
  
    it 'routes to #update via PUT' do
    expect(put: '/services/1').to route_to('services#update', id: '1')
    end
    
    it 'routes to #destroy via DELETE' do
    expect(delete: '/services/1').to route_to('services#destroy', id: '1')
    end
  end


end

end
