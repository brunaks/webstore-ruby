require_relative './database'

# create makes the resource immediately
@product = Product.create(
  name: "Mu Shirt" )

@product_stock = ProductStock.create( 
  product:        @product,
  purchase_price: 100.00,
  units_in_stock: 10
)

@product_price = ProductPrice.create( 
  product:        @product,
  price:          150.00,
  begin_date:     Date.today(),
  end_date:       Date.parse('9999-12-31') 
)

require_relative './web_store'


# Or new gives you it back unsaved, for more operations
#@post = EmployeeRecord.new(:title => ..., ...)
#@post.save                           # persist the resource