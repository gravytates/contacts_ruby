# require "capybara/rspec"
# require "./app"
# Capybara.app = Sinatra::Application
# set(:show_exceptions, false)
#
# describe("the contact creation path", {:type => :feature}) do
#   it("processes the user input and adds contact to contacts array") do
#     visit("/contact/new")
#     fill_in("area_code", :with => "503")
#     fill_in("number", :with => "5555555")
#     fill_in("type", :with => "home")
#     click_button("Add Contact")
#     expect(page).to have_content(" Details ")
#   end
# end
