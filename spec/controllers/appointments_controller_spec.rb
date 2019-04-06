require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
#    describe 'appointment controller request specs' do
#     context 'GET #index' do
#       it 'should succeessfully render an index page' do
#       get :index
#       expect(response).to have_http_status(200)
#       expect(response).to render_template :index
#     end
#   end

#     context 'GET #show' do
#       let!(:appointment) { create :appointment}
#       it 'should succeessfully render an showpage' do
#       get :show, params: { id: appointment.id }
#       expect(response).to have_http_status(200)
#       expect(response).to render_template :show
#     end
#   end

#     describe 'POST #create' do
#       context 'with valid parameters' do
#       let!(:appointment) {FactoryBot.create :appointment}
#         let!(:valid_params) do 
#           { date: appointment.date, 
#             start_time: appointment.start_time, 
#             status: appointment.status, 
#             dog_id: appointment.dog_id, 
#             walker_id: appointment.walker_id, service_id: appointment.service_id}
#         end

#           it 'creates new appointment' do
#           expect { post(:create, params: { appointment: valid_params}) }.to change(Appointment, :count).by(0)
#           expect(flash[:notice]).to eq "appointment was created"
#           end
#       end
#     end

#     context 'PUT #update' do
#       let!(:appointment) { create :appointment}

#       it 'should update appointment info' do
#       params = {
#         date: appointment.date, 
#         start_time: appointment.start_time, 
#         status: appointment.status, 
#         dog_id: appointment.dog_id, 
#         walker_id: appointment.walker_id, 
#         service_id: appointment.service_id
#       }
#       put :update, params: {id: appointment.id, appointment: params}
#       appointment.reload
#       params.keys.each do |key|
#         expect(appointment.attributes[key.to_s]).to eq(params[key])
#       end
#     end
#   end

#     context 'DELETE #destroy' do
#       let!(:appointment) { create :appointment}
#       it 'should delete appointment' do
#      expect { delete :destroy, params: {id: appointment.id}}.to change(Appointment, :count).by(-1)
#      expect(flash[:notice]).to eq 'appointment was successfully deleted'
#     end
#   end

#   context 'Routing' do 
#     it 'routes to #index' do
#     expect(get: '/appointments').to route_to('appointments#index')
#     end

#     it 'routes to #show' do
#     expect(get: '/appointments/1').to route_to('appointments#show', id: '1')
#     end

#     it 'routes to #new' do
#     expect(get: '/appointments/new').to route_to('appointments#new')
#     end
    
#     it 'routes to #create' do
#     expect(post: '/appointments').to route_to('appointments#create')
#     end
  
#     it 'routes to #update via PUT' do
#     expect(put: '/appointments/1').to route_to('appointments#update', id: '1')
#     end
    
#     it 'routes to #destroy via DELETE' do
#     expect(delete: '/appointments/1').to route_to('appointments#destroy', id: '1')
#     end
#   end

# end
end
