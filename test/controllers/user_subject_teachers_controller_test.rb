require 'rails_helper'

RSpec.describe UserSubjectTeachersController, type: :controller do
  let(:user) { create(:user) }
  let(:personal_record) { create(:personal_record, contacts: user.email) }
  let(:subject_teacher) { create(:subject_teacher) }
  let(:valid_attributes) { attributes_for(:user_subject_teacher, user_id: user.id, subject_teacher_id: subject_teacher.id) }
  let(:invalid_attributes) { attributes_for(:user_subject_teacher, user_id: nil, subject_teacher_id: subject_teacher.id) }

  before do
    sign_in(user)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let(:user_subject_teacher) { create(:user_subject_teacher) }

    it 'returns a success response' do
      get :show, params: { id: user_subject_teacher.id }
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
    let(:user_subject_teacher) { create(:user_subject_teacher) }

    it 'returns a success response' do
      get :edit, params: { id: user_subject_teacher.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new UserSubjectTeacher' do
        expect {
          post :create, params: { user_subject_teacher: valid_attributes }
        }.to change(UserSubjectTeacher, :count).by(1)
      end

      it 'redirects to the created user subject teacher' do
        post :create, params: { user_subject_teacher: valid_attributes }
        expect(response).to redirect_to(user_subject_teacher_path(UserSubjectTeacher.last))
      end
    end

    context 'with invalid params' do
      it 'does not create a new UserSubjectTeacher' do
        expect {
          post :create, params: { user_subject_teacher: invalid_attributes }
        }.to_not change(UserSubjectTeacher, :count)
      end

      it 'renders the new template with unprocessable_entity status' do
        post :create, params: { user_subject_teacher: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    let(:user_subject_teacher) { create(:user_subject_teacher) }

    context 'with valid params' do
      let(:valid_update_attributes) { attributes_for(:user_subject_teacher, score: 90) }

      it 'updates the requested user subject teacher' do
        patch :update, params: { id: user_subject_teacher.id, user_subject_teacher: valid_update_attributes }
        user_subject_teacher.reload
        expect(user_subject_teacher.score).to eq(90)
      end

      it 'redirects to the user subject teacher' do
        patch :update, params: { id: user_subject_teacher.id, user_subject_teacher: valid_update_attributes }
        expect(response).to redirect_to(user_subject_teacher_path(user_subject_teacher))
      end
    end

    context 'with invalid params' do
      it 'does not update the requested user subject teacher' do
        previous_score = user_subject_teacher.score
        patch :update, params: { id: user_subject_teacher.id, user_subject_teacher: invalid_attributes }
        user_subject_teacher.reload
        expect(user_subject_teacher.score).to eq(previous_score)
      end

      it 'renders the edit template with unprocessable_entity status' do
        patch :update, params: { id: user_subject_teacher.id, user_subject_teacher: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:user_subject_teacher) { create(:user_subject_teacher) }

    it 'destroys the requested user subject teacher' do
      expect {
        delete :destroy, params: { id: user_subject_teacher.id }
      }.to change(UserSubjectTeacher, :count).by(-1)
    end

    it 'redirects to the user subject teachers list' do
      delete :destroy, params: { id: user_subject_teacher.id }
      expect(response).to redirect_to(user_subject_teachers_path)
    end
  end
end
