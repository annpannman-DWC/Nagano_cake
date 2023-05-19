class Delivery < ApplicationRecord
  belongs_to :customer, optional: true
  
  
end
