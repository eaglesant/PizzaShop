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

post '/cart' do
	# @arr = []
	# @orders = params[:orders].split(',')
	# @orders.each do |i|
	# 	i.slice!(0..7)
	# 	@arr << i.split('=')
		
	# end
	# @summ = 0
	# @arr.each do |i|
	# 	@summ += i[1].to_i
	# end
	# erb :cart

	#=======================
	orders = params[:orders]
	@arr = parse_orders_item orders
	@arr.each do |item|
		item[0] = Product.find(item[0])
	end
	@qtt = 0
	@summ = 0
	erb :cart
end
def parse_orders_item orders_line
	s1 = orders_line.split(',')
arr = []
	s1.each do |x|

		s2 = x.split('=')
		s3 = s2[0].split('_')

		id = s3[1]
		cnt = s2[1]
		arr2 = [id,cnt]
		arr.push arr2
	end
	return arr
end