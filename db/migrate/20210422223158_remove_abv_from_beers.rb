class RemoveAbvFromBeers < ActiveRecord::Migration[6.1]
  def change
    remove_column :beers, :abv, :float
  end
end
