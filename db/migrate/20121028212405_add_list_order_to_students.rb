class AddListOrderToStudents < ActiveRecord::Migration
  def change
    change_table :students do |t|
      t.integer :list_order
    end
  end
end
