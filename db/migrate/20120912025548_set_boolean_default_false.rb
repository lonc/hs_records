class SetBooleanDefaultFalse < ActiveRecord::Migration
  def up
    change_table :assignments do |t|
      t.remove :studentupdate
      t.boolean :studentupdate, :default => false
    end
    change_table :subjects do |t|
      t.remove :graded
      t.remove :repeating
      t.remove :studentupdate
      t.boolean :graded, :default => false
      t.boolean :repeating, :default => false
      t.boolean :studentupdate, :default => false
    end
  end
  def down
    change_table :assignments do |t|
      t.remove :studentupdate, :default => false
      t.boolean :studentupdate
    end
    change_table :subjects do |t|
      t.remove :graded, :default => false
      t.remove :repeating, :default => false
      t.remove :studentupdate, :default => false
      t.boolean :graded
      t.boolean :repeating
      t.boolean :studentupdate
    end
  end
end

