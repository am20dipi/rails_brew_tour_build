class AddBeerIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :beer_id, :integer
  end
end
