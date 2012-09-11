class AddRepeatingToSubjects < ActiveRecord::Migration
  def change
    change_table :subjects do |t|
      t.binary :repeating
    end
  end
end
