require "capybara/rspec"
require "./app"
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the contact creation path", {:type => :feature}) do
  it("processes the user input and adds contact to contacts array") do
    visit("/contact/new")
    fill_in("first_name", :with => "madam")
    fill_in("last_name", :with => "smith")
    fill_in("job_title", :with => "valet")
    fill_in("company", :with => "marriott")
    click_button("Add Contact")
    expect(page).to have_content("Contact Hub")
  end
end
