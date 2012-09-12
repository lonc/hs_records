class RemoveBinaryFields < ActiveRecord::Migration
  def up
    change_table :assignments do |t|
      t.remove :studentupdate
      t.boolean :studentupdate
    end
    change_table :subjects do |t|
      t.remove :graded
      t.remove :repeating
      t.boolean :graded
      t.boolean :repeating
    end
  end

  def down
    change_table :assignments do |t|
      t.remove :studentupdate
      t.binary :studentupdate
    end
    change_table :subjects do |t|
      t.remove :graded
      t.remove :repeating
      t.binary :graded
      t.binary :repeating
    end
  end
end
