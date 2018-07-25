require("bundler/setup")
require("sinatra/activerecord")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  binding.pry
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
  Brand.create({:shoe_name => shoe_name})
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
