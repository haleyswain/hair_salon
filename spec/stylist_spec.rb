require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#name') do
    it("tells you the stylists name") do
      stylist = Stylist.new({:name => "Edward Scissorhands", :id => nil})
      stylist.save()
      expect(stylist.name()).to(eq('Edward Scissorhands'))
    end
  end

  describe("#save") do
    it("lets you save stylists to the database") do
      stylist = Stylist.new({:name => "Edward Scissorhands", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#==") do
  it("is the same stylist if it has the same name") do
    stylist1 = Stylist.new({:name => "Edward Scissorhands", :id => nil})
    stylist2 = Stylist.new({:name => "Edward Scissorhands", :id => nil})
    expect(stylist1).to(eq(stylist2))
  end
end

describe("#clients") do
    it("returns an array of clients for that stylist") do
      test_stylist = Stylist.new({:name => "Edward Scissorhands", :id => nil})
      test_stylist.save()
      test_client = Client.new({:id => nil, :name => "Dr Seuss", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:id => nil, :name => "Harry Potter", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      stylist = Stylist.new({:name => "Edward Scissorhands", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#delete') do
    it('allows the user to delete a stylist from the database') do
      test_stylist1 = Stylist.new({:id => nil, :name => "Edward Scissorhands"})
      test_stylist1.save()
      test_stylist2 = Stylist.new({:id => nil, :name => "Sally Stylist"})
      test_stylist2.save()
      test_stylist1.delete()
      expect(Stylist.all()).to(eq([test_stylist2]))
    end
  end
end
