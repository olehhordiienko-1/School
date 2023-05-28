require "test_helper"

class PersonalRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personal_record = personal_records(:one)
  end

  test "should get index" do
    get personal_records_url
    assert_response :success
  end

  test "should get new" do
    get new_personal_record_url
    assert_response :success
  end

  test "should create personal_record" do
    assert_difference("PersonalRecord.count") do
      post personal_records_url, params: { personal_record: { contacts: @personal_record.contacts, description: @personal_record.description, education: @personal_record.education, first_name: @personal_record.first_name, last_name: @personal_record.last_name, middle_name: @personal_record.middle_name } }
    end

    assert_redirected_to personal_record_url(PersonalRecord.last)
  end

  test "should show personal_record" do
    get personal_record_url(@personal_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_personal_record_url(@personal_record)
    assert_response :success
  end

  test "should update personal_record" do
    patch personal_record_url(@personal_record), params: { personal_record: { contacts: @personal_record.contacts, description: @personal_record.description, education: @personal_record.education, first_name: @personal_record.first_name, last_name: @personal_record.last_name, middle_name: @personal_record.middle_name } }
    assert_redirected_to personal_record_url(@personal_record)
  end

  test "should destroy personal_record" do
    assert_difference("PersonalRecord.count", -1) do
      delete personal_record_url(@personal_record)
    end

    assert_redirected_to personal_records_url
  end
end
