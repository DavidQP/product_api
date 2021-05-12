class Product < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true

    has_many :variants, dependent: :destroy


end
