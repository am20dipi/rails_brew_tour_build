class AddUserIdToBeers < ActiveRecord::Migration[6.1]
  def change
    add_column :beers, :user_id, :integer
  end
end
