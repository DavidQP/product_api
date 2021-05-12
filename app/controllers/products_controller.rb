class ProductsController < ApplicationController
  def load
    @products = JSON.parse(File.read('app/assets/javascript/test.json'))
    count = 0
    @products.each do |product|
      name = product['name']
      description = product['description']
      product_object = Product.new(name: name, description: description)

      variants = product['variants']

      puts name
      puts description

       variants.each do |variant|
        puts "\n\n"
        puts "Las variantes son: "
         variant_name = variant['name']
         variant_price = variant['price']
         puts variant_name
         puts variant_price
         product_object.variants.new(name: variant_name, price: variant_price.to_f)
       end

      if product_object.save
         count += 1
         puts "\n\n"
         puts count
         puts "\n\n"
      end

    end

    render json: { :message => "El número de productos que han subido es #{count} de #{@products.count}" }
    
  end

end
