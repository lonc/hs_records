class AddAssignmentDaysToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :AssignOnMonday, :binary
    add_column :subjects, :AssignOnTuesday, :binary
    add_column :subjects, :AssignOnWednesday, :binary
    add_column :subjects, :AssignOnThursday, :binary
    add_column :subjects, :AssignOnFriday, :binary
  end
end
