class CreateGardensToAuthorsJoinTable < ActiveRecord::Migration
  def change
    create_table :garden_authors do |t|
      t.references :garden, index: true
      t.references :author, index: true
    end
  end
end
