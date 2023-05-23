class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  def full_name
    "#{last_name} #{first_name}"
  end
  
  validates :email, :first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :address, :postal_code, :password, presence: true
  
end
