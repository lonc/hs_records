class AddResourceToSubject < ActiveRecord::Migration
  def change
    change_table :subjects do |t|
      t.remove :book_name, :student_id
      t.references :resource, :null => false, :default => 1
    end
  end
end
