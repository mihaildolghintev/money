require "application_system_test_case"

class IncomeCategoriesTest < ApplicationSystemTestCase
  setup do
    @income_category = income_categories(:one)
  end

  test "visiting the index" do
    visit income_categories_url
    assert_selector "h1", text: "Income Categories"
  end

  test "creating a Income category" do
    visit income_categories_url
    click_on "New Income Category"

    fill_in "Name", with: @income_category.name
    click_on "Create Income category"

    assert_text "Income category was successfully created"
    click_on "Back"
  end

  test "updating a Income category" do
    visit income_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @income_category.name
    click_on "Update Income category"

    assert_text "Income category was successfully updated"
    click_on "Back"
  end

  test "destroying a Income category" do
    visit income_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Income category was successfully destroyed"
  end
end
