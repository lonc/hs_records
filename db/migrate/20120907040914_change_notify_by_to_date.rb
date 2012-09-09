class ChangeNotifyByToDate < ActiveRecord::Migration
  def up
    change_table :assignments do |t|
      t.remove :notifyby
      t.date :notify_by
    end
  end

  def down
    change_table :assignments do |t|
      t.remove :notify_by
      t.integer :notifyby
    end
  end
end
