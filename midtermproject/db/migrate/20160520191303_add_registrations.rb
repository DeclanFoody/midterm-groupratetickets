class AddRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references(:user)
      t.references(:event)
      t.integer :num_tickets

      t.timestamps
    end
  end
end
