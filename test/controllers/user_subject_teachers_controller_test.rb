require "test_helper"

class UserSubjectTeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_subject_teacher = user_subject_teachers(:one)
  end

  test "should get index" do
    get user_subject_teachers_url
    assert_response :success
  end

  test "should get new" do
    get new_user_subject_teacher_url
    assert_response :success
  end

  test "should create user_subject_teacher" do
    assert_difference("UserSubjectTeacher.count") do
      post user_subject_teachers_url, params: { user_subject_teacher: { score: @user_subject_teacher.score, subject_teacher_id: @user_subject_teacher.subject_teacher_id, user_id: @user_subject_teacher.user_id } }
    end

    assert_redirected_to user_subject_teacher_url(UserSubjectTeacher.last)
  end

  test "should show user_subject_teacher" do
    get user_subject_teacher_url(@user_subject_teacher)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_subject_teacher_url(@user_subject_teacher)
    assert_response :success
  end

  test "should update user_subject_teacher" do
    patch user_subject_teacher_url(@user_subject_teacher), params: { user_subject_teacher: { score: @user_subject_teacher.score, subject_teacher_id: @user_subject_teacher.subject_teacher_id, user_id: @user_subject_teacher.user_id } }
    assert_redirected_to user_subject_teacher_url(@user_subject_teacher)
  end

  test "should destroy user_subject_teacher" do
    assert_difference("UserSubjectTeacher.count", -1) do
      delete user_subject_teacher_url(@user_subject_teacher)
    end

    assert_redirected_to user_subject_teachers_url
  end
end
