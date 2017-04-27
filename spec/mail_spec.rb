require('rspec')
require('mail')

 describe(Address) do
   before() do
     Address.clear()
   end

   describe("#street") do
     it("will initialize a new street address") do
      test_address = Address.new({:street => '123 abode dr.', :city => 'hometon', :state => 'Being', :zip => 97222,:type => 'home'})
      expect((test_address.street)).to(eq('123 abode dr.'))
     end
   end

   describe("#city") do
     it("will initialize a new city address") do
      test_address = Address.new({:street => '123 abode dr.', :city => 'hometon', :state => 'Being', :zip => 97222,:type => 'home'})
      expect((test_address.city)).to(eq('hometon'))
     end
   end

   describe("#save") do
     it("will add a new address to contact") do
      test_address = Address.new({:street => '123 abode dr.', :city => 'hometon', :state => 'Being', :zip => 97222,:type => 'home'})
      test_address.save()
      expect((Address.all)).to(eq([test_address]))
     end
   end

  describe(".all") do
     it("is empty at first") do
       expect(Address.all()).to(eq([]))
     end
   end

   describe(".clear") do
     it("empties out all of the saved addresses") do
       Address.new({:street => '123 abode dr.', :city => 'hometon', :state => 'Being', :zip => 97222,:type => 'home'}).save()
       Address.clear()
       expect(Address.all()).to(eq([]))
     end
   end

   describe('#id') do
     it('returns address id') do
       test_address = Address.new({:street => '123 abode dr.', :city => 'hometon', :state => 'Being', :zip => 97222,:type => 'home'})
       test_address.save()
       expect(test_address.id()).to(eq(1))
     end
   end

   describe('.find') do
     it('returns contact by id') do
       test_address = Address.new({:street => '123 abode dr.', :city => 'hometon', :state => 'Being', :zip => 97222,:type => 'home'})
       test_address.save()
       test_address2 = Address.new({:street => '456 casa dr.', :city => 'Es Bario', :state => 'Wonder', :zip => 97122,:type => 'away'})
       test_address2.save()
       expect(Address.find(test_address.id())).to(eq(test_address))
     end
   end

 end
