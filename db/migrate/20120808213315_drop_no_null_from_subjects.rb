class DropNoNullFromSubjects < ActiveRecord::Migration
  def change
    change_table :subjects do |t|
      t.remove :student_id
      t.remove :resource_id
      t.references :student
      t.references :resource
    end
  end
end
