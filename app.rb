require("bundler/setup")
require("sinatra/activerecord")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/brands') do
  @brands = Brand.all
  erb(:brands)
end

post('/brands') do
  shoe_name = params.fetch('shoe_name')
  @brand = Brand.create({:shoe_name => shoe_name})
  @brands = Brand.all
  erb(:brands)
end

get('/brands/new') do
  @brands = Brand.all
  erb(:brands)
end

post('/brands/new') do
  shoe_name = params.fetch('shoe_name')
  price = params.fetch('price').to_i
  Brand.create({:shoe_name => shoe_name, :price => price})
  redirect back
end


get('/stores') do
  @stores = Store.all
  erb(:stores)
end

get('/stores/new') do
  @stores = Store.all
  erb(:store_form)
end

post('/stores/new') do
  name = params.fetch('name')
  @store = Store.create({:name => name})
  @stores = Store.all
  erb(:stores)
end

get('/stores/:id') do
  id = params.fetch(:id)
  @store = Store.find(id)
  erb(:store_edit)
end

patch('/stores/:id') do
  id = params.fetch(:id)
  @project = Project.find(params.fetch("id").to_i())
  @project.update({:title => title})
  redirect("/")
end

delete('/stores/:id') do
  @store = Store.find(params.fetch("id").to_i())
  @store.delete()
  @stores = Store.all()
  redirect("/stores")
end
