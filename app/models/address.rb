class Address < ApplicationRecord
  belongs_to :customer
  
  def address_display
   '〒' + postal_code + ' ' + address + ' ' + name
  end
  
  validates :address, presence: true
  validates :postal_code, presence: true, length: { minimum: 0, maximum: 7 }
  validates :name, presence: true
end
