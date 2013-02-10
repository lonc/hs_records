class MoveIdFromSubjectsToResources < ActiveRecord::Migration
  def up
    change_table :subjects do |t|
      t.remove :resource_id
    end
    change_table :resources do |t|
      t.integer :subject_id
    end
  end

  def down
    change_table :subjects do |t|
      t.integer :resource_id
    end
    change_table :resources do |t|
      t.remove :subject_id
    end
  end
end
