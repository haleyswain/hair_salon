require('spec_helper')

describe(Client) do
  describe("#save") do
    it("lets you save clients to the database") do
      client = Client.new({:name => "Callie Customer", :id => nil, :stylist_id => 1})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end
end
