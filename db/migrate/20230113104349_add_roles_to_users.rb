class AddRolesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :superadmin_role, :boolean, default: false
    add_column :users, :doctor_role, :boolean, default: false
    add_column :users, :nurse_role, :boolean, default: false
    add_column :users, :user_role, :boolean, default: true
  end
end
