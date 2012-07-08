class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, :null => false
      t.string :email
      t.string :parent
      t.string :phone_h
      t.string :phone_c
      t.string :phone_w
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.date :birthdate

      t.timestamps
    end
  end
end
