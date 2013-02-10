class ReaddStudentToSubject < ActiveRecord::Migration
  def change
    change_table :subjects do |t|
      t.references :student, :default => 1, :null=> false
    end
  end
end
