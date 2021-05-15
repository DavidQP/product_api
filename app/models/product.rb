class Product < ApplicationRecord
    validates :name, presence: true, allow_blank: false
    validates :description, presence: true, allow_blank: false

    has_many :variants, dependent: :destroy

    validates :variants, :length => { :minimum => 1}

end
