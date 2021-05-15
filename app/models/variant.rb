class Variant < ApplicationRecord
    validates :name, presence: true, allow_blank: false
    validates :price, presence: true, :numericality => { greater_than: 0 }

    belongs_to :product
end
