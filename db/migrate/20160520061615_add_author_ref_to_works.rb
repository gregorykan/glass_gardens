class AddAuthorRefToWorks < ActiveRecord::Migration
  def change
    add_reference :works, :author, index: true, foreign_key: true
  end
end
