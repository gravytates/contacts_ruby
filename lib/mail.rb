class Address
  attr_accessor(:street, :city, :state, :zip, :type, :id)

  @@addresses = []

  define_method(:initialize) do |attributes|
    @street = attributes.fetch(:street)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip = attributes.fetch(:zip)
    @type = attributes.fetch(:type)
    @id = @@addresses.length.+(1)
  end

  define_singleton_method(:all) do
    @@addresses
  end

  define_method(:save) do
    @@addresses.push(self)
  end

  define_singleton_method(:clear) do
    @@addresses = []
  end

  define_singleton_method(:find) do |identification|
    matched_address = nil
    @@addresses.each() do |address|
      if address.id() == identification.to_i
        matched_address = address
      end
    end
    matched_address
  end
end
