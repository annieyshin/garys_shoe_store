require("bundler/setup")
require("sinatra/activerecord")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/stores') do
  @stores = Store.all
  erb(:stores)
end

get('/brands') do
  @brands = Brand.all
  erb(:brands)
end
