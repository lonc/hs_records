class AddWatchForToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :watchfor, :text

  end
end
