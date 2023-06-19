require "application_system_test_case"

class UserSubjectTeachersTest < ApplicationSystemTestCase
  setup do
    @user_subject_teacher = user_subject_teachers(:one)
  end

  test "visiting the index" do
    visit user_subject_teachers_url
    assert_selector "h1", text: "User subject teachers"
  end

  test "should create user subject teacher" do
    visit user_subject_teachers_url
    click_on "New user subject teacher"

    fill_in "Score", with: @user_subject_teacher.score
    fill_in "Subject teacher", with: @user_subject_teacher.subject_teacher_id
    fill_in "User", with: @user_subject_teacher.user_id
    click_on "Create User subject teacher"

    assert_text "User subject teacher was successfully created"
    click_on "Back"
  end

  test "should update User subject teacher" do
    visit user_subject_teacher_url(@user_subject_teacher)
    click_on "Edit this user subject teacher", match: :first

    fill_in "Score", with: @user_subject_teacher.score
    fill_in "Subject teacher", with: @user_subject_teacher.subject_teacher_id
    fill_in "User", with: @user_subject_teacher.user_id
    click_on "Update User subject teacher"

    assert_text "User subject teacher was successfully updated"
    click_on "Back"
  end

  test "should destroy User subject teacher" do
    visit user_subject_teacher_url(@user_subject_teacher)
    click_on "Destroy this user subject teacher", match: :first

    assert_text "User subject teacher was successfully destroyed"
  end
end
