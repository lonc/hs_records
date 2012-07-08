class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name, :null => false
      t.string :book_name, :null => false
      t.integer :student_id, :null => false
      t.binary :graded
      t.references :student, :null => false

      t.timestamps
     end
   end
end
