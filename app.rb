require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => 'hair_salon_test'})

get('/') do
  erb(:index)
end

get('/stylist_list') do
  @stylists = Stylist.all()
  erb(:stylist_list)
end

post('/stylist_list') do
  name = params.fetch('new_stylist')
  stylist = Stylist.new(:name => name, :id => nil)
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylist_list)
end

get('/stylist_list/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @clients = @stylist.clients()
  erb(:stylist)
end

post('/stylist/:id') do
  name = params.fetch('name')
  stylist_id = Stylist.find(params.fetch('stylist_id').to_i())
  @stylist = Stylist.find(stylist_id)
  @clients = Client.new({:id => nil, :name => name, :stylist_id => stylist_id})
  @clients.save()
  @clients = @stylist.clients()
  erb(:stylist)
end

delete('/stylist/:id/delete') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:stylist_list)
end

patch('/stylist/:id/edit') do
  name = params.fetch("edit_name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  @clients = @stylist.clients()
  erb(:stylist)
end

get('/client_list') do
  @clients = Client.all()
  erb(:client_list)
end

get('/client_list/:id') do
  @client = Client.find(params.fetch("id").to_i())
  erb(:client)
end

delete('/client_list/:id') do
  @client = Client.find(params.fetch('id').to_i())
  @client.delete()
  @client = Client.all()
  erb(:client_list)
end

patch('/client_list/:id') do
  @name = params.fetch('name')
  @id = params.fetch('id').to_i()
  @stylist_id = params.fetch('stylist_id').to_i()
  @client = Client.find(params.fetch('id')).to_i()
  @client.update({:name => name, :id => id, :stylist_id => stylist_id})
  erb(:client_list)
end
