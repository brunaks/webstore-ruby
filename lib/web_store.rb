require 'sinatra/base'

class WebStore < Sinatra::Base
  
  set :public_folder, File.dirname(__FILE__) + '/../static'

  get '/' do
    redirect('/index.html')
  end

  get '/hello-mu' do
    Product.all.to_json(methods: [:product_prices,:product_stocks])
  end
end