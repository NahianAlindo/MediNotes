class RemovePatientsFkFromUsers < ActiveRecord::Migration[6.0]
  def change
    if foreign_key_exists?(:patients, :users)
      remove_foreign_key :patients, :users
    end
  end
end
