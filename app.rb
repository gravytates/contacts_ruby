require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*/')
also_reload('views/**/*.erb')
require('./lib/contact')


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
  @contact = Contact.new({:first_name => 'Fred', :last_name => 'Smith', :job_title => 'Lawn Mower', :company => 'Self Employed'})
  @contact.save()
  redirect('/')
  erb(:index)
end
