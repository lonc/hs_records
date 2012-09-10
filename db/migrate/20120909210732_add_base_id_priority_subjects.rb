class AddBaseIdPrioritySubjects < ActiveRecord::Migration
  def up
    change_table :subjects do |t|
      t.integer :base_id
      t.integer :priority
    end
  end

  def down
    change_table :subjects do |t|
      t.remove :base_id
      t.remove :priority
    end
  end
end
