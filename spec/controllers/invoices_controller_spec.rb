require 'rails_helper'

RSpec.describe InvoicesController, type: :controller do
#    describe 'invoice controller request specs' do
#     context 'GET #index' do
#       it 'should successfully render an index page' do
#       get :index
#       expect(response).to have_http_status(200)
#       expect(response).to render_template :index
#     end
#   end

#     context 'GET #show' do
#       let!(:invoice) { create :invoice}
#       it 'should successfully render an showpage' do
#       get :show, params: { id: invoice.id }
#       expect(response).to have_http_status(200)
#       expect(response).to render_template :show
#     end
#   end

#     describe 'POST #create' do
#       context 'with valid parameters' do
#       let!(:invoice) {FactoryBot.create :invoice}
#         let!(:valid_params) do 
#           { amount: invoice.amount,
#             walked: invoice.walked,
#             walk_rating: invoice.walk_rating,
#             notes: invoice.notes,
#             owner_comments: invoice.owner_comments,
#             walker_comments: invoice.walker_comments,
#             appointment_id: invoice.appointment_id}
#         end

#           it 'creates new invoice' do
#           expect { post(:create, params: { invoice: valid_params}) }.to change(Invoice, :count).by(0)
#           expect(flash[:notice]).to eq "invoice was created"
#           end
#       end
#     end

#     context 'PUT #update' do
#       let!(:invoice) { create :invoice}

#       it 'should update invoice info' do
#       params = {
#         amount: invoice.amount,
#         walked: invoice.walked,
#         walk_rating: invoice.walk_rating,
#         notes: invoice.notes,
#         owner_comments: invoice.owner_comments,
#         walker_comments: invoice.walker_comments,
#         appointment_id: invoice.appointment_id
#       }
#       put :update, params: {id: invoice.id, invoice: params}
#       invoice.reload
#       params.keys.each do |key|
#         expect(invoice.attributes[key.to_s]).to eq(params[key])
#       end
#     end
#   end

#     context 'DELETE #destroy' do
#       let!(:invoice) { create :invoice}
#       it 'should delete invoice' do
#      expect { delete :destroy, params: {id: invoice.id}}.to change(Invoice, :count).by(-1)
#      expect(flash[:notice]).to eq 'invoice was successfully deleted'
#     end
#   end

#   context 'Routing' do 
#     it 'routes to #index' do
#     expect(get: '/invoices').to route_to('invoices#index')
#     end

#     it 'routes to #show' do
#     expect(get: '/invoices/1').to route_to('invoices#show', id: '1')
#     end

#     it 'routes to #new' do
#     expect(get: '/invoices/new').to route_to('invoices#new')
#     end
    
#     it 'routes to #create' do
#     expect(post: '/invoices').to route_to('invoices#create')
#     end
  
#     it 'routes to #update via PUT' do
#     expect(put: '/invoices/1').to route_to('invoices#update', id: '1')
#     end
    
#     it 'routes to #destroy via DELETE' do
#     expect(delete: '/invoices/1').to route_to('invoices#destroy', id: '1')
#     end
#   end
  
# end
end
