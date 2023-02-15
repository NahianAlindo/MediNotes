class CreateDosages < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :contact_number
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
    create_table :dosages do |t|
      t.datetime :timestamp
      t.integer :blood_sugar_level
      t.integer :prescribed_insulin
      t.integer :applied_insulin
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
