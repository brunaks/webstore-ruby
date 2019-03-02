require 'data_mapper'
require 'dm-migrations'

DataMapper::Logger.new($stdout, :debug)

# A Sqlite3 connection to a persistent database
DataMapper.setup(:default, 'sqlite:///Users/bruna/Desktop/store/sqlite.db')

class Product
  include DataMapper::Resource

  property :id,          Serial    # An auto-increment integer key
  property :name,        String
  has n, :product_prices
  has n, :product_stocks
end

class ProductPrice
  include DataMapper::Resource

  property :id, Serial
  property :price, Float
  property :begin_date, Date
  property :end_date, Date
  belongs_to :product
end

class ProductStock
  include DataMapper::Resource

  property :id, Serial
  property :purchase_price, Float
  property :units_in_stock, Integer
  belongs_to :product
end

DataMapper.finalize
#DataMapper.auto_upgrade!
DataMapper.auto_migrate!