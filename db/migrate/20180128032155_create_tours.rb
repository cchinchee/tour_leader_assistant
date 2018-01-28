class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.date :start_date, null:false
      t.date :end_date, null:false
      t.text :itinerary
      t.timestamps
    end
  end
end
