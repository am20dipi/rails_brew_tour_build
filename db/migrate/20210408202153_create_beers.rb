class CreateBeers < ActiveRecord::Migration[6.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.float :abv
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
