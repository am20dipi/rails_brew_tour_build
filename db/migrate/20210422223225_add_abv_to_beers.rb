class AddAbvToBeers < ActiveRecord::Migration[6.1]
  def change
    add_column :beers, :abv, :decimal, precision: 4, scale: 1
  end
end
