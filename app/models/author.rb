class Author < ActiveRecord::Base

  has_many :works
  has_many :garden_authors
  has_many :gardens, through: :garden_authors

end