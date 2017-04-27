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

describe('add address route', {:type => :feature}) do
  it("allows another address to be added to the form") do
    @contact = Contact.new({:first_name => 'Bob', :last_name => 'Jo', :job_title => "lawn mower", :company => 'self employed'})
    visit("/contact_list/#{ @contact.id }/add_address") ## requires double quotes for interpolation to work.
    fill_in('street', :with => '123 who cares')
    fill_in('city', :with => 'hometon')
    fill_in('state', :with => 'portland')
    fill_in('zip', :with => '97222')
    fill_in('type', :with => 'home')
    expect(page).to have_content("Contact hub")
  end
end
