class ProductsController < ApplicationController

  def index
    @products = Product.all

    @allProducts = []

    render json: @products, :include => :variants 

  end

  def show
    @product = Product.find(params[:id])
    render json: @product, :include => :variants
  end

  def load
    @products = JSON.parse(File.read('app/assets/javascript/test.json'))
    count = 0
    total = @products.count
    @products.each do |product|
      name = product['name']
      description = product['description']
      
      if (!name.blank? && !description.blank?)
        product_object = Product.new(name: name.strip, description: description.strip)

        variants = product['variants']


        if !variants.nil?
          variants.each do |variant|
            variant_name = variant['name']
            variant_price = variant['price']

            if (!variant_name.blank? && !(variant_price.nil? || variant_price <= 0))
              puts variant_name 
              product_object.variants.new(name: variant_name.strip, price: variant_price.to_f)
            end          

          end
          
          if product_object.save
            count += 1
            puts product_object.name
            product['is_loaded'] = true

          else
            product['is_loaded'] = false
          end
        else 
          product['is_loaded'] = false    
        end
      else 
        product['is_loaded'] = false
      end
      
    end

    render json: {:products => @products, 

                  :kpi => {
                    "total": total,
                    "loaded": count
                  } 
                }

  end

end
