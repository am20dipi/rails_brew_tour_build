class RemoveColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :breweries, :user_id
  end
end
