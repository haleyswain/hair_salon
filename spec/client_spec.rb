require('spec_helper')

describe(Client) do
  describe("#save") do
    it("lets you save clients to the database") do
      client = Client.new({:name => "Callie Customer", :id => nil, :stylist_id => 1})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end

  describe(".all") do
    it("starts off with no clients") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#update') do
   it('will update a client when the user wants to change the database') do
     test_client1 = Client.new({:id => nil, :name => 'Gunner', :stylist_id => 1})
     test_client1.save()
     test_client1.update({:name => "Murphy"})
     expect(test_client1.name()).to(eq("Murphy"))
    end
  end

  describe("#==") do
  it("is the same client if it has the same name and id") do
    client1 = Client.new({:name => "Murphy", :id => nil, :stylist_id => nil})
    client2 = Client.new({:name => "Murphy", :id => nil, :stylist_id => nil})
    expect(client1).to(eq(client2))
  end
end

describe(".find") do
   it("returns a client by its ID") do
     test_client = Client.new({:name => "Murphy", :id => nil, :stylist_id => 1})
     test_client.save()
     test_client2 = Client.new({:name => "Gunner", :id => nil, :stylist_id => 1})
     test_client2.save()
     expect(Client.find(test_client2.id())).to(eq(test_client2))
   end
 end

 describe('#delete') do
    it('will delete a client from the database') do
      test_client1 = Client.new({:id => nil, :name => 'Jack', :stylist_id => 1})
      test_client1.save()
      test_client2 = Client.new({:id => nil, :name => 'John', :stylist_id => 1})
      test_client2.save()
      test_client2.delete()
      expect(Client.all()).to(eq([test_client1]))
    end
  end
end
