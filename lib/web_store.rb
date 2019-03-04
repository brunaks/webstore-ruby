require 'sinatra/base'

class WebStore < Sinatra::Base
  
  set :public_folder, File.dirname(__FILE__) + '/../static'

  get '/' do
    redirect('/index')
  end

  get '/index' do
    haml :index, locals: { products: Product.all }
  end

  get '/new_product' do
    haml :new_product 
  end

  post '/new_product' do
    p params
    product = Product.create(
      name: params[:product_name] )
    redirect '/index'
  end

  get '/delete_product/:id' do
    id = params[:id]
    p id
    product = Product.get(id)
    p product.destroy!
    redirect '/index'   
  end

  get '/hello-mu' do
    Product.all.to_json(methods: [:product_prices,:product_stocks])
  end
end