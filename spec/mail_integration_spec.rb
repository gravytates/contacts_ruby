# require "capybara/rspec"
# require "./app"
# Capybara.app = Sinatra::Application
# set(:show_exceptions, false)
#
# describe("the address creation path", {:type => :feature}) do
#   it("processes the user input and adds address to addresses array") do
#     visit("/contact/new")
#     fill_in("street", :with => "123 street")
#     fill_in("city", :with => "hometon")
#     fill_in("state", :with => "being")
#     fill_in("zip", :with => "97222")
#     fill_in("type", :with => "home")
#     click_button("Add Address")
#     expect(page).to have_content("  Detais ")
#   end
# end
