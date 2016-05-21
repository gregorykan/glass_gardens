class GardenAuthor < ActiveRecord::Base

  belongs_to :author
  belongs_to :garden

end