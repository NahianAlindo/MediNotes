class AddUserToPatient < ActiveRecord::Migration[6.0]
  def change
    add_reference :patients, :user, null: true, foreign_key: true
  end
end
