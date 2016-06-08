class AddEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.integer :num_user
      t.float :reg_price
      t.float :disc_price 
      t.integer :min_required
      t.string :image_url
      t.string :location
      
      t.timestamps
    end
  end
end
