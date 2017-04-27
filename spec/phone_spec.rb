require('rspec')
require('phone')

 describe(Phone) do
   before() do
     Phone.clear()
   end

   describe("#area_code") do
     it("will display an area code") do
      test_phone = Phone.new({:area_code => 503, :number => 5555555, :type => 'home'})
      expect((test_phone.area_code)).to(eq(503))
     end
   end

   describe("#number") do
     it("will display a phone number") do
      test_phone = Phone.new({:area_code => 503, :number => 5555555, :type => 'home'})
      expect((test_phone.number)).to(eq(5555555))
     end
   end

   describe("#save") do
     it("will add a new email to contact") do
      test_phone = Phone.new({:area_code => 503, :number => 5555555, :type => 'home'})
      test_phone.save()
      expect((Phone.all)).to(eq([test_phone]))
     end
   end

  describe(".all") do
     it("is empty at first") do
       expect(Phone.all()).to(eq([]))
     end
   end

   describe(".clear") do
     it("empties out all of the saved addresses") do
       Phone.new({:area_code => 503, :number => 5555555, :type => 'home'}).save()
       Phone.clear()
       expect(Phone.all()).to(eq([]))
     end
   end

   describe('#id') do
     it('returns address id') do
       test_phone = Phone.new({:area_code => 503, :number => 5555555, :type => 'home'})
       test_phone.save()
       expect(test_phone.id()).to(eq(1))
     end
   end

   describe('.find') do
     it('returns contact by id') do
       test_phone = Phone.new({:area_code => 503, :number => 5555555, :type => 'home'})
       test_phone.save()
       test_phone2 = Phone.new({:area_code => 513, :number => 5555554, :type => 'cell'})
       test_phone2.save()
       expect(Phone.find(test_phone.id())).to(eq(test_phone))
     end
   end

 end
