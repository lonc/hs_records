class RemoveCompletedBoxAndDate < ActiveRecord::Migration
  def up
    change_table :assignments do |t|
      t.remove :completed
      t.remove :date_completed
    end
  end

  def down
    change_table :assignments do |t|
      t.binary :completed
      t.date   :date_completed
    end
  end
end
