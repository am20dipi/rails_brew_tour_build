class RemoveTypeFromBeers < ActiveRecord::Migration[6.1]
  def change
    remove_column :beers, :type, :string
  end
end
