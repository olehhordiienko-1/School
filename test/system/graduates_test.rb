require "application_system_test_case"

class GraduatesTest < ApplicationSystemTestCase
  setup do
    @graduate = graduates(:one)
  end

  test "visiting the index" do
    visit graduates_url
    assert_selector "h1", text: "Graduates"
  end

  test "should create graduate" do
    visit graduates_url
    click_on "New graduate"

    fill_in "Feedback", with: @graduate.feedback
    fill_in "First name", with: @graduate.first_name
    fill_in "Graduation year", with: @graduate.graduation_year
    fill_in "Last name", with: @graduate.last_name
    fill_in "University", with: @graduate.university
    fill_in "Zno scores", with: @graduate.zno_scores
    click_on "Create Graduate"

    assert_text "Graduate was successfully created"
    click_on "Back"
  end

  test "should update Graduate" do
    visit graduate_url(@graduate)
    click_on "Edit this graduate", match: :first

    fill_in "Feedback", with: @graduate.feedback
    fill_in "First name", with: @graduate.first_name
    fill_in "Graduation year", with: @graduate.graduation_year
    fill_in "Last name", with: @graduate.last_name
    fill_in "University", with: @graduate.university
    fill_in "Zno scores", with: @graduate.zno_scores
    click_on "Update Graduate"

    assert_text "Graduate was successfully updated"
    click_on "Back"
  end

  test "should destroy Graduate" do
    visit graduate_url(@graduate)
    click_on "Destroy this graduate", match: :first

    assert_text "Graduate was successfully destroyed"
  end
end
