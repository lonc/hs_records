class AddSubjectNickName < ActiveRecord::Migration
  def up
    change_table :subjects do |t|
      t.text :nickname
    end
  end

  def down
    change_table :subjects do |t|
      t.remove :nickname
    end
  end
end
