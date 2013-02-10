class ChangeBinaryToBoolean < ActiveRecord::Migration
  def up
    change_table :assignments do |t|
      t.remove :assigned
      t.boolean :assigned
    end
  end

  def down
    change_table :assignments do |t|
      t.remove :assigned
      t.binary :assigned
    end
  end
end
