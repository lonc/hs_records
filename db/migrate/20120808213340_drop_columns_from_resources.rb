class DropColumnsFromResources < ActiveRecord::Migration
  def change
    change_table :resources do |t|
      t.remove :publication_date
    end
  end
end
