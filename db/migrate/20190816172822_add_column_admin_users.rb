class AddColumnAdminUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :admin_users,:remember_created_at,:datetime
  end
  def down
    remove_column :admin_users,:remember_created_at,:datetime
  end
end
