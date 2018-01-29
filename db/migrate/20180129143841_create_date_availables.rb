class CreateDateAvailables < ActiveRecord::Migration[5.1]
  def change
    create_table :date_availables do |t|
      t.date :start_date, null:false
      t.date :end_date, null:false
	  t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
