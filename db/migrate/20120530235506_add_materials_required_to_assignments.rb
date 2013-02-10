class AddMaterialsRequiredToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :materialsrequired, :text

    add_column :assignments, :notifyby, :integer

  end
end
