class AddBaseIdToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :baseid, :integer, :default => 1, :null => false
  end
end
