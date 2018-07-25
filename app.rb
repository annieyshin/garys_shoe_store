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

get('/brands/:id') do
  id = params.fetch(:id)
  @brand = Brand.find(id)
  @stores = Store.all
  erb(:brand_edit)
end

post('/brands/:id/edit') do
  brand_id = params.fetch('brand_id').to_i
  shoe_store = params.fetch('shoe_store').to_i
  @brand = Brand.find(brand_id)
  store = Store.find(shoe_store)
  @brand.stores.push(store)
  @stores = Store.all
  redirect("/")
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
  name = params.fetch("name")
  @store = Store.find(params.fetch("id").to_i())
  @store.update({:name => name})
  redirect("/")
end

delete('/stores/:id') do
  @store = Store.find(params.fetch("id").to_i())
  @store.delete()
  @stores = Store.all()
  redirect("/stores")
end
