require 'rails_helper'

RSpec.describe SubjectTeachersController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let(:subject_teacher) { create(:subject_teacher) }

    it 'returns a success response' do
      get :show, params: { id: subject_teacher.id }
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
    let(:subject_teacher) { create(:subject_teacher) }

    it 'returns a success response' do
      get :edit, params: { id: subject_teacher.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { attributes_for(:subject_teacher) }
    let(:invalid_attributes) { attributes_for(:subject_teacher, subject_id: nil) }

    context 'with valid params' do
      it 'creates a new SubjectTeacher' do
        expect {
          post :create, params: { subject_teacher: valid_attributes }
        }.to change(SubjectTeacher, :count).by(1)
      end

      it 'redirects to the created subject teacher' do
        post :create, params: { subject_teacher: valid_attributes }
        expect(response).to redirect_to(subject_teacher_path(SubjectTeacher.last))
      end
    end

    context 'with invalid params' do
      it 'does not create a new SubjectTeacher' do
        expect {
          post :create, params: { subject_teacher: invalid_attributes }
        }.to_not change(SubjectTeacher, :count)
      end

      it 'renders the new template with unprocessable_entity status' do
        post :create, params: { subject_teacher: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    let(:subject_teacher) { create(:subject_teacher) }
    let(:valid_attributes) { attributes_for(:subject_teacher, academic_year: '2023-2024') }
    let(:invalid_attributes) { attributes_for(:subject_teacher, academic_year: nil) }

    context 'with valid params' do
      it 'updates the requested subject teacher' do
        patch :update, params: { id: subject_teacher.id, subject_teacher: valid_attributes }
        subject_teacher.reload
        expect(subject_teacher.academic_year).to eq('2023-2024')
      end

      it 'redirects to the subject teacher' do
        patch :update, params: { id: subject_teacher.id, subject_teacher: valid_attributes }
        expect(response).to redirect_to(subject_teacher_path(subject_teacher))
      end
    end

    context 'with invalid params' do
      it 'does not update the requested subject teacher' do
        patch :update, params: { id: subject_teacher.id, subject_teacher: invalid_attributes }
        subject_teacher.reload
        expect(subject_teacher.academic_year).to_not be_nil
      end

      it 'renders the edit template with unprocessable_entity status' do
        patch :update, params: { id: subject_teacher.id, subject_teacher: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:subject_teacher) { create(:subject_teacher) }

    it 'destroys the requested subject teacher' do
      expect {
        delete :destroy, params: { id: subject_teacher.id }
      }.to change(SubjectTeacher, :count).by(-1)
    end

    it 'redirects to the subject teachers list' do
      delete :destroy, params: { id: subject_teacher.id }
      expect(response).to redirect_to(subject_teachers_path)
    end
  end
end
