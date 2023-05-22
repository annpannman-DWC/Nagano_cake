class Item < ApplicationRecord
  
  has_one_attached :image
  
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  
  validates :name, presence: true
  validates :caption, length: { minimum: 0, maximum: 500 }
  validates :price, presence: true
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end
  
  def self.search_for(search,word)
    if search == 'perfect'
      Item.where(name: word)
    elsif search == 'forward'
      Item.where('name LIkE ?', word + '%')
    elsif search == 'backward'
      Item.where('name LIkE ?', '%' + word)
    else
      Item.where('name LIKE ?', '%' + word + '%')
    end
  end
  
end
