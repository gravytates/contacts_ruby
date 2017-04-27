class Contact
  attr_accessor(:first_name, :last_name, :job_title, :company, :id)
  @@contacts = []

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @id = @@contacts.length().+(1)
    @addresses = []
    @emails = []
    @phones = []
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:find) do |identification|
    matched_contact = nil
    @@contacts.each() do |contact|
      if contact.id() == identification.to_i
        matched_contact = contact
      end
    end
    matched_contact
  end

  define_method(:add_address) do |address|
    @addresses.push(address)
  end

  define_method(:add_email) do |email|
    @emails.push(email)
  end

  define_method(:add_phone) do |phone|
    @phones.push(phone)
  end
end
