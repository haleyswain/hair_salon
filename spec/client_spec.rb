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

  describe("#==") do
  it("is the same client if it has the same name and id") do
    client1 = Client.new({:name => "Murphy", :id => nil, :stylist_id => nil})
    client2 = Client.new({:name => "Murphy", :id => nil, :stylist_id => nil})
    expect(client1).to(eq(client2))
  end
end
end
