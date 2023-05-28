require "application_system_test_case"

class PersonalRecordsTest < ApplicationSystemTestCase
  setup do
    @personal_record = personal_records(:one)
  end

  test "visiting the index" do
    visit personal_records_url
    assert_selector "h1", text: "Personal records"
  end

  test "should create personal record" do
    visit personal_records_url
    click_on "New personal record"

    fill_in "Contacts", with: @personal_record.contacts
    fill_in "Description", with: @personal_record.description
    fill_in "Education", with: @personal_record.education
    fill_in "First name", with: @personal_record.first_name
    fill_in "Last name", with: @personal_record.last_name
    fill_in "Middle name", with: @personal_record.middle_name
    click_on "Create Personal record"

    assert_text "Personal record was successfully created"
    click_on "Back"
  end

  test "should update Personal record" do
    visit personal_record_url(@personal_record)
    click_on "Edit this personal record", match: :first

    fill_in "Contacts", with: @personal_record.contacts
    fill_in "Description", with: @personal_record.description
    fill_in "Education", with: @personal_record.education
    fill_in "First name", with: @personal_record.first_name
    fill_in "Last name", with: @personal_record.last_name
    fill_in "Middle name", with: @personal_record.middle_name
    click_on "Update Personal record"

    assert_text "Personal record was successfully updated"
    click_on "Back"
  end

  test "should destroy Personal record" do
    visit personal_record_url(@personal_record)
    click_on "Destroy this personal record", match: :first

    assert_text "Personal record was successfully destroyed"
  end
end
