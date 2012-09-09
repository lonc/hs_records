class RemoveBaseidFromSubjects < ActiveRecord::Migration
  def up
    change_table :subjects do |t|
      t.remove :baseid
    end
  end

  def down
    change_table :subjects do |t|
      t.number :baseid
    end
  end
end
