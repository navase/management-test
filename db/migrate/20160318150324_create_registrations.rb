class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :consumption_data
      t.boolean :verified, default: false
      t.references :branch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
