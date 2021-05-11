class Variant < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true

    belongs_to :product
end
