class DashboardsController < ApplicationController
  before_action :load_json_data, only: [:create]
  def index
    @dashboards = Dashboard.all

    render json: @dashboards
  end

  def new
  end

  def create

    #@products = JSON.parse(File.read('app/assets/javascript/test.json'))
    @products = JSON.parse(@generateProducts.to_json)
    
    total = @products.count
    count = 0
    not_uploaded = 0
    start_time = Time.current
    @products.each do |product|
      name = product['name']
      description = product['description']

      product_object = Product.new(name: name, description: description)

      variants = product['variants']

      if !variants.nil?
        variants.each do |variant|
          variant_name = variant['name']
          variant_price = variant['price']

          product_object.variants.new(name: variant_name, price: variant_price)          

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
      
      
    end

    end_time = Time.current
    @dashboard = Dashboard.new

    if @products.count > 0
      not_uploaded = total - count
      @dashboard.total = total
      @dashboard.uploaded = count
      @dashboard.not_uploaded = not_uploaded
      @dashboard.start_time = start_time
      @dashboard.end_time = end_time
      @dashboard.loading_time = (end_time - start_time)

      @dashboard.save 
    else 
      @dashboard.total = 0
      @dashboard.uploaded = 0
      @dashboard.not_uploaded = 0
            
      @dashboard.save
    end

    render json: {:products => @products, 

                  :kpi => {
                    "total": @dashboard.total,
                    "uploaded": @dashboard.uploaded,
                    "not_uploaded": @dashboard.not_uploaded
                  } 
                }

  end

  private

  def load_json_data
    random_product_number = rand(0 .. 10000)

    @generateProducts = []

    random_product_number.times do
      
      name = Faker::Commerce.product_name
      description = Faker::Hipster.paragraph
      variants = []

      random_product_variants = rand(0 .. 3)
      random_product_variants.times do
        variant_name = Faker::Commerce.material
        price =  Faker::Commerce.price
        variant = {
          'name': variant_name,
          'price': price
        }
        variants.push(variant)
      end

      product = {
        'name': name,
        'description': description,
        'variants': variants
      }

      @generateProducts.push(product)

    end
  end

end
