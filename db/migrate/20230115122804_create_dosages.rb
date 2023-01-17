class CreateDosages < ActiveRecord::Migration[6.0]
  def change
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
