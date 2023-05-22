class Genre < ApplicationRecord

  has_many :items
  
  validates :name, presence: true

  def self.search_for(search,word)
    if search == 'perfect'
      Genre.where(name: word)
    elsif search == 'forward'
      Genre.where('name LIkE ?', word + '%')
    elsif search == 'backward'
      Genre.where('name LIkE ?', '%' + word)
    else
      Genre.where('name LIKE ?', '%' + word + '%')
    end
  end

end
