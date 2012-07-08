class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :assignment, :null => false
      t.binary :assigned
      t.date :date_assigned
      t.binary :completed
      t.date :date_completed
      t.decimal :score
      t.references :subject, :null => false

      t.timestamps
    end
  end
end
