class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.date :start_date, null:false
      t.date :end_date, null:false
      t.text :itinerary
      t.string :customer_name
      t.string :customer_email
      t.string :customer_phone
      t.string :address
      t.string :state
      t.string :city
      t.string :postcode
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
