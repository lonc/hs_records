class AddStudentLoggingToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :studentupdate, :binary

  end
end
