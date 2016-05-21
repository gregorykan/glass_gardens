class Garden < ActiveRecord::Base

  has_many :garden_authors
  has_many :authors, through: :garden_authors

  def author_names
    authors.map { |x| x.name }.join(", ")
  end

end