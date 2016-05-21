class Garden < ActiveRecord::Base

  has_many :garden_authors
  has_many :authors, through: :garden_authors

end