require('rspec')
require('email')

 describe(Email) do
   before() do
     Email.clear()
   end

   describe("#address") do
     it("will initialize a new email address") do
      test_email = Email.new({:address => 'yoboy@hotmail.com', :type => 'home'})
      expect((test_email.address)).to(eq('yoboy@hotmail.com'))
     end
   end

   describe("#save") do
     it("will add a new email to contact") do
      test_email = Email.new({:address => 'yoboy@hotmail.com', :type => 'home'})
      test_email.save()
      expect((Email.all)).to(eq([test_email]))
     end
   end

  describe(".all") do
     it("is empty at first") do
       expect(Email.all()).to(eq([]))
     end
   end

   describe(".clear") do
     it("empties out all of the saved addresses") do
       Email.new({:address => 'yoboy@hotmail.com', :type => 'home'}).save()
       Email.clear()
       expect(Email.all()).to(eq([]))
     end
   end

   describe('#id') do
     it('returns address id') do
       test_email = Email.new({:address => 'yoboy@hotmail.com', :type => 'home'})
       test_email.save()
       expect(test_email.id()).to(eq(1))
     end
   end

   describe('.find') do
     it('returns contact by id') do
       test_email = Email.new({:address => 'yoboy@hotmail.com', :type => 'home'})
       test_email.save()
       test_email2 = Email.new({:address => 'otherboy@hotmail.com', :type => 'away'})
       test_email2.save()
       expect(Email.find(test_email.id())).to(eq(test_email))
     end
   end

 end
