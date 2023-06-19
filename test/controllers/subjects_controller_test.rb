require 'rails_helper'

RSpec.describe SubjectsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let(:subject) { create(:subject) }

    it 'returns a success response' do
      get :show, params: { id: subject.id }
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
    let(:subject) { create(:subject) }

    it 'returns a success response' do
      get :edit, params: { id: subject.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { attributes_for(:subject) }
    let(:invalid_attributes) { attributes_for(:subject, name: nil) }

    context 'with valid params' do
      it 'creates a new Subject' do
        expect {
          post :create, params: { subject: valid_attributes }
        }.to change(Subject, :count).by(1)
      end

      it 'redirects to the created subject' do
        post :create, params: { subject: valid_attributes }
        expect(response).to redirect_to(subject_path(Subject.last))
      end
    end

    context 'with invalid params' do
      it 'does not create a new Subject' do
        expect {
          post :create, params: { subject: invalid_attributes }
        }.to_not change(Subject, :count)
      end

      it 'renders the new template with unprocessable_entity status' do
        post :create, params: { subject: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    let(:subject) { create(:subject) }
    let(:valid_attributes) { attributes_for(:subject, hours: 60) }
    let(:invalid_attributes) { attributes_for(:subject, name: nil) }

    context 'with valid params' do
      it 'updates the requested subject' do
        patch :update, params: { id: subject.id, subject: valid_attributes }
        subject.reload
        expect(subject.hours).to eq(60)
      end

      it 'redirects to the subject' do
        patch :update, params: { id: subject.id, subject: valid_attributes }
        expect(response).to redirect_to(subject_path(subject))
      end
    end

    context 'with invalid params' do
      it 'does not update the requested subject' do
        patch :update, params: { id: subject.id, subject: invalid_attributes }
        subject.reload
        expect(subject.name).to_not be_nil
      end

      it 'renders the edit template with unprocessable_entity status' do
        patch :update, params: { id: subject.id, subject: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:subject) { create(:subject) }

    it 'destroys the requested subject' do
      expect {
        delete :destroy, params: { id: subject.id }
      }.to change(Subject, :count).by(-1)
    end

    it 'redirects to the subjects list' do
      delete :destroy, params: { id: subject.id }
      expect(response).to redirect_to(subjects_path)
    end
  end
end
