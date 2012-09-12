class SetDefaultValueAssigned < ActiveRecord::Migration
  def up
    change_table :assignments do |t|
      t.remove :assigned
      t.boolean :assigned, :default => false
    end
  end

  def down
    change_table :assignments do |t|
      t.remove :assigned, :default => false
      t.boolean :assigned
    end
  end
end
