class AddUserIdToBreweries < ActiveRecord::Migration[6.1]
  def change
    add_column :breweries, :user_id, :integer
  end
end
