class AddColumnEndUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :end_users,:remember_created_at,:datetime
  end
  def down
    remove_column :end_users,:remember_created_at,:datetime
  end
end
