#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

before do
	@products = Product.all
end

class Product < ActiveRecord::Base
	
end

get '/' do
	erb :index
end
get '/about' do
	erb :about
end
get '/pizzas' do
	erb :pizzas
end
get '/cart' do

	erb 'Hello'
end
post '/cart' do
	@arr = []
	@orders = params[:orders].split(',')
	@orders.each do |i|
		i.slice!(0..7)
		@arr << i.split('=')
		
	end
	@summ = 0
	@arr.each do |i|
		@summ += i[1].to_i
	end
	erb :cart
end