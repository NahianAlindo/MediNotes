class CreatePrescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :prescriptions do |t|
      t.timestamp :prescribed_on
      t.date :start_date
      t.date :end_date
      t.integer :prescribed_insulin
      t.text :comments
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
