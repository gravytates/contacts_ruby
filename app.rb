require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*/')
also_reload('views/**/*.erb')
require('./lib/contact')
require('./lib/mail')
require('./lib/phone')
require('./lib/email')
require('pry')


get('/') do
  erb(:index)
end

get('/contact/new') do
  erb(:contact_form)
end


post('/contact') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  job_title = params.fetch('job_title')
  company = params.fetch('company')
  @contact = Contact.new({:first_name => first_name, :last_name => last_name, :job_title => job_title, :company => company})
  @contact.save()

  redirect('/')
  erb(:index)
end

# get('/')

post('/contact_list/:id/add_address/new_address') do
  street = params.fetch('street')
  city = params.fetch('city')
  state = params.fetch('state')
  zip = params.fetch('zip')
  type = params.fetch('type')

  @address = Address.new({:street => street, :city => city, :state => state, :zip => zip, :type => type})
  @address.save()
  @contact = Contact.find(params.fetch('id').to_i())
  @contact.add_address(@address)

  redirect('/')
  erb(:index)
end

# post('/phone') do
#   first_name = params.fetch('first_name')
#   last_name = params.fetch('last_name')
#   job_title = params.fetch('job_title')
#   company = params.fetch('company')
#   @contact = Contact.new({:first_name => first_name, :last_name => last_name, :job_title => job_title, :company => company})
#   @contact.save()
#
#   redirect('/')
#   erb(:index)
# end
#
# post('/email') do
#   first_name = params.fetch('first_name')
#   last_name = params.fetch('last_name')
#   job_title = params.fetch('job_title')
#   company = params.fetch('company')
#   @contact = Contact.new({:first_name => first_name, :last_name => last_name, :job_title => job_title, :company => company})
#   @contact.save()
#
#   redirect('/')
#   erb(:index)
# end





get('/contact_list') do
  @contacts = Contact.all
  erb(:contact_list)
end

get('/contact_list/:id') do
  @contact = Contact.find(params.fetch('id').to_i)
  erb(:contact_details)
end

get('/contact_list/:id/add_address') do
  @contact = Contact.find(params.fetch('id').to_i)
  erb(:mail_form)
end

get('/contact_list/:id/add_phone') do
  @contact = Contact.find(params.fetch('id').to_i)
  erb(:phone_form)
end

get('/contact_list/:id/add_email') do
  @contact = Contact.find(params.fetch('id').to_i)
  erb(:email_form)
end
