class Delivery < ApplicationRecord
  belongs_to :customer, optional: true
  
  
  def delivery_display
   '〒' + postal_code + ' ' + address + ' ' + address_name
  end

  validates :address, presence: true
  validates :postal_code, presence: true, length: { minimum: 0, maximum: 7 }
  validates :name, presence: true

end
