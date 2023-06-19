require 'rails_helper'

RSpec.describe PriceListsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let(:price_list) { create(:price_list) }

    it 'returns a success response' do
      get :show, params: { id: price_list.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    let(:price_list) { create(:price_list) }

    it 'returns a success response' do
      get :edit, params: { id: price_list.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { attributes_for(:price_list) }
    let(:invalid_attributes) { attributes_for(:price_list, payment_type: nil) }

    context 'with valid params' do
      it 'creates a new PriceList' do
        expect {
          post :create, params: { price_list: valid_attributes }
        }.to change(PriceList, :count).by(1)
      end

      it 'redirects to the created price list' do
        post :create, params: { price_list: valid_attributes }
        expect(response).to redirect_to(price_list_path(PriceList.last))
      end
    end

    context 'with invalid params' do
      it 'does not create a new PriceList' do
        expect {
          post :create, params: { price_list: invalid_attributes }
        }.to_not change(PriceList, :count)
      end

      it 'renders the new template with unprocessable_entity status' do
        post :create, params: { price_list: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    let(:price_list) { create(:price_list) }
    let(:valid_attributes) { attributes_for(:price_list, payment_type: 'New Payment Type') }
    let(:invalid_attributes) { attributes_for(:price_list, payment_type: nil) }

    context 'with valid params' do
      it 'updates the requested price list' do
        patch :update, params: { id: price_list.id, price_list: valid_attributes }
        price_list.reload
        expect(price_list.payment_type).to eq('New Payment Type')
      end

      it 'redirects to the price list' do
        patch :update, params: { id: price_list.id, price_list: valid_attributes }
        expect(response).to redirect_to(price_list_path(price_list))
      end
    end

    context 'with invalid params' do
      it 'does not update the requested price list' do
        patch :update, params: { id: price_list.id, price_list: invalid_attributes }
        price_list.reload
        expect(price_list.payment_type).to_not be_nil
      end

      it 'renders the edit template with unprocessable_entity status' do
        patch :update, params: { id: price_list.id, price_list: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:price_list) { create(:price_list) }

    it 'destroys the requested price list' do
      expect {
        delete :destroy, params: { id: price_list.id }
      }.to change(PriceList, :count).by(-1)
    end

    it 'redirects to the price lists list' do
      delete :destroy, params: { id: price_list.id }
      expect(response).to redirect_to(price_lists_path)
    end
  end
end
