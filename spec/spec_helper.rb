require("rspec")
require("pg")
require("stylist")
require("client")

DB = PG.connect({:dbname => "to_do_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM clients *;")
    DB.exec("DELETE FROM stylists *;")
  end
end
