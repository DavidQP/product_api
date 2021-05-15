class Dashboard < ApplicationRecord
    validates :total, :numericality => { greater_than_or_equal_to: 0 }
    validates :uploaded, :numericality => { greater_than_or_equal_to: 0 }
    validates :not_uploaded, :numericality => { greater_than_or_equal_to: 0 }
    
end
