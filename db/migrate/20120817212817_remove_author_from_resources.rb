class RemoveAuthorFromResources < ActiveRecord::Migration
  def up
    change_table :resources do |t|
      t.remove :Author
    end
  end

  def down
    change_table :resources do |t|
      t.string :Author
    end
  end
end
