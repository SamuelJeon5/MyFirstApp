require "application_system_test_case"

class MyfriendsTest < ApplicationSystemTestCase
  setup do
    @myfriend = myfriends(:one)
  end

  test "visiting the index" do
    visit myfriends_url
    assert_selector "h1", text: "Myfriends"
  end

  test "creating a Myfriend" do
    visit myfriends_url
    click_on "New Myfriend"

    fill_in "Email", with: @myfriend.email
    fill_in "First name", with: @myfriend.first_name
    fill_in "Last name", with: @myfriend.last_name
    fill_in "Phone", with: @myfriend.phone
    fill_in "Twitter", with: @myfriend.twitter
    click_on "Create Myfriend"

    assert_text "Myfriend was successfully created"
    click_on "Back"
  end

  test "updating a Myfriend" do
    visit myfriends_url
    click_on "Edit", match: :first

    fill_in "Email", with: @myfriend.email
    fill_in "First name", with: @myfriend.first_name
    fill_in "Last name", with: @myfriend.last_name
    fill_in "Phone", with: @myfriend.phone
    fill_in "Twitter", with: @myfriend.twitter
    click_on "Update Myfriend"

    assert_text "Myfriend was successfully updated"
    click_on "Back"
  end

  test "destroying a Myfriend" do
    visit myfriends_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Myfriend was successfully destroyed"
  end
end
