require "application_system_test_case"

class PriceListsTest < ApplicationSystemTestCase
  setup do
    @price_list = price_lists(:one)
  end

  test "visiting the index" do
    visit price_lists_url
    assert_selector "h1", text: "Price lists"
  end

  test "should create price list" do
    visit price_lists_url
    click_on "New price list"

    fill_in "Description", with: @price_list.description
    fill_in "Payment type", with: @price_list.payment_type
    fill_in "Tuition cost", with: @price_list.tuition_cost
    fill_in "Year", with: @price_list.year
    click_on "Create Price list"

    assert_text "Price list was successfully created"
    click_on "Back"
  end

  test "should update Price list" do
    visit price_list_url(@price_list)
    click_on "Edit this price list", match: :first

    fill_in "Description", with: @price_list.description
    fill_in "Payment type", with: @price_list.payment_type
    fill_in "Tuition cost", with: @price_list.tuition_cost
    fill_in "Year", with: @price_list.year
    click_on "Update Price list"

    assert_text "Price list was successfully updated"
    click_on "Back"
  end

  test "should destroy Price list" do
    visit price_list_url(@price_list)
    click_on "Destroy this price list", match: :first

    assert_text "Price list was successfully destroyed"
  end
end
