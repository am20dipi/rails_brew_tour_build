class AddBreweryIdToBeers < ActiveRecord::Migration[6.1]
  def change
    add_column :beers, :brewery_id, :integer
  end
end
