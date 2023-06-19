require 'rails_helper'

RSpec.describe GraduatesController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let(:graduate) { create(:graduate) }

    it 'returns a success response' do
      get :show, params: { id: graduate.id }
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
    let(:graduate) { create(:graduate) }

    it 'returns a success response' do
      get :edit, params: { id: graduate.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { attributes_for(:graduate) }
    let(:invalid_attributes) { attributes_for(:graduate, first_name: nil) }

    context 'with valid params' do
      it 'creates a new Graduate' do
        expect {
          post :create, params: { graduate: valid_attributes }
        }.to change(Graduate, :count).by(1)
      end

      it 'redirects to the created graduate' do
        post :create, params: { graduate: valid_attributes }
        expect(response).to redirect_to(graduate_path(Graduate.last))
      end
    end

    context 'with invalid params' do
      it 'does not create a new Graduate' do
        expect {
          post :create, params: { graduate: invalid_attributes }
        }.to_not change(Graduate, :count)
      end

      it 'renders the new template with unprocessable_entity status' do
        post :create, params: { graduate: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    let(:graduate) { create(:graduate) }
    let(:valid_attributes) { attributes_for(:graduate, first_name: 'New Name') }
    let(:invalid_attributes) { attributes_for(:graduate, first_name: nil) }

    context 'with valid params' do
      it 'updates the requested graduate' do
        patch :update, params: { id: graduate.id, graduate: valid_attributes }
        graduate.reload
        expect(graduate.first_name).to eq('New Name')
      end

      it 'redirects to the graduate' do
        patch :update, params: { id: graduate.id, graduate: valid_attributes }
        expect(response).to redirect_to(graduate_path(graduate))
      end
    end

    context 'with invalid params' do
      it 'does not update the requested graduate' do
        patch :update, params: { id: graduate.id, graduate: invalid_attributes }
        graduate.reload
        expect(graduate.first_name).to_not be_nil
      end

      it 'renders the edit template with unprocessable_entity status' do
        patch :update, params: { id: graduate.id, graduate: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:graduate) { create(:graduate) }

    it 'destroys the requested graduate' do
      expect {
        delete :destroy, params: { id: graduate.id }
      }.to change(Graduate, :count).by(-1)
    end

    it 'redirects to the graduates list' do
      delete :destroy, params: { id: graduate.id }
      expect(response).to redirect_to(graduates_path)
    end
  end
end
