class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title, :null => false
      t.string :Publisher
      t.string :Author
      t.string :publication_date

      t.timestamps
    end
  end
end
