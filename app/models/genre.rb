class Genre < ApplicationRecord

  has_many :items
  
  validates :name, presence: true

  def self.search_for(search,word)
    Genre.where(name: word)
  end

end
