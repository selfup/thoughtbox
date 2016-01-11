require "test_helper"
require "capybara"

class UserGetsRedirectedFromRootTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = Thoughtbox::Application
  end

  test "visitor tries to visit root" do
    visit "/"

    assert_equal "/validate", current_path
    assert page.has_content?("Login")
  end

end
