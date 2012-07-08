class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :jot

      t.timestamps
    end
  end
end
