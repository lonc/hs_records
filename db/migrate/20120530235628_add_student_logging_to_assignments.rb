class AddStudentLoggingToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :studentupdate, :binary

  end
end
