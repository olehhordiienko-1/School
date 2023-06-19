require 'rails_helper'

RSpec.describe PersonalRecordsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let(:personal_record) { create(:personal_record) }

    it 'returns a success response' do
      get :show, params: { id: personal_record.id }
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
    let(:personal_record) { create(:personal_record) }

    it 'returns a success response' do
      get :edit, params: { id: personal_record.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { attributes_for(:personal_record) }
    let(:invalid_attributes) { attributes_for(:personal_record, first_name: nil) }

    context 'with valid params' do
      it 'creates a new PersonalRecord' do
        expect {
          post :create, params: { personal_record: valid_attributes }
        }.to change(PersonalRecord, :count).by(1)
      end

      it 'redirects to the created personal record' do
        post :create, params: { personal_record: valid_attributes }
        expect(response).to redirect_to(personal_record_path(PersonalRecord.last))
      end
    end

    context 'with invalid params' do
      it 'does not create a new PersonalRecord' do
        expect {
          post :create, params: { personal_record: invalid_attributes }
        }.to_not change(PersonalRecord, :count)
      end

      it 'renders the new template with unprocessable_entity status' do
        post :create, params: { personal_record: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    let(:personal_record) { create(:personal_record) }
    let(:valid_attributes) { attributes_for(:personal_record, first_name: 'New Name') }
    let(:invalid_attributes) { attributes_for(:personal_record, first_name: nil) }

    context 'with valid params' do
      it 'updates the requested personal record' do
        patch :update, params: { id: personal_record.id, personal_record: valid_attributes }
        personal_record.reload
        expect(personal_record.first_name).to eq('New Name')
      end

      it 'redirects to the personal record' do
        patch :update, params: { id: personal_record.id, personal_record: valid_attributes }
        expect(response).to redirect_to(personal_record_path(personal_record))
      end
    end

    context 'with invalid params' do
      it 'does not update the requested personal record' do
        patch :update, params: { id: personal_record.id, personal_record: invalid_attributes }
        personal_record.reload
        expect(personal_record.first_name).to_not be_nil
      end

      it 'renders the edit template with unprocessable_entity status' do
        patch :update, params: { id: personal_record.id, personal_record: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:personal_record) { create(:personal_record) }

    it 'destroys the requested personal record' do
      expect {
        delete :destroy, params: { id: personal_record.id }
      }.to change(PersonalRecord, :count).by(-1)
    end

    it 'redirects to the personal records list' do
      delete :destroy, params: { id: personal_record.id }
      expect(response).to redirect_to(personal_records_path)
    end
  end
end
