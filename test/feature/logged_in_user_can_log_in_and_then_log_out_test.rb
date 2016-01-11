require "test_helper"
require "capybara"

class UserCanSignUpTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = Thoughtbox::Application
  end

  test "visitor visits root and then clicks login" do
    visit "/"

    assert_equal "/validate", current_path

    click_link_or_button "Login"

    assert_equal "/login", current_path
  end

  test "visitor logs in" do
    visit "/login"

    fill_in 'email_address', with: 'wow@wow.com'
    fill_in 'password_digest', with: 'password'
    click_button "Submit"

    assert_equal '/', current_path

    click_link_or_button "Logout"
  end
end
