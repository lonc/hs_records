class SetBooleanDefaultFalse < ActiveRecord::Migration
  def change 
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
end

