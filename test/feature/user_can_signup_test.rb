require "test_helper"
require "capybara"

class UserCanSignUpTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = Thoughtbox::Application
  end

  test "visitor visits root and then clicks signup" do
    visit "/"
    assert_equal "/validate", current_path

    click_link_or_button "Sign Up"
    assert_equal "/signup", current_path
  end

  test "visitor signs up" do
    visit "/"
    assert_equal "/validate", current_path
    click_link_or_button "Sign Up"
    assert_equal "/signup", current_path

    fill_in 'user[email_address]', with: 'wow@wow.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Submit'
  end

  test "visitor cannot sign up with already used email" do
    visit "/"
    assert_equal "/validate", current_path
    click_link_or_button "Sign Up"
    assert_equal "/signup", current_path

    fill_in 'user[email_address]', with: 'wow@wow.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Submit'
    assert_equal "/signup", current_path
  end

  test "visitor can sign up" do
    visit "/"
    assert_equal "/validate", current_path
    click_link_or_button "Sign Up"
    assert_equal "/signup", current_path

    fill_in 'user[email_address]', with: 'nice@nice.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'

    assert_equal "/signup", current_path
    click_button 'Submit'
    assert_equal "/", current_path

    click_link_or_button "Logout"
  end

end
