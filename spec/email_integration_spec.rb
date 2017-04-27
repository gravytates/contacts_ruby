# require "capybara/rspec"
# require "./app"
# Capybara.app = Sinatra::Application
# set(:show_exceptions, false)
#
# describe("the email creation path", {:type => :feature}) do
#   it("processes the user input and adds email to emails array") do
#     visit("/contact/new")
#     fill_in("address", :with => "address@mail.com")
#     fill_in("type", :with => "home")
#
#     click_button("Add Contact")
#     expect(page).to have_content(" Details ")
#   end
# end
