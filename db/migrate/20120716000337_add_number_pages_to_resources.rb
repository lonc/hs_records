class AddNumberPagesToResources < ActiveRecord::Migration
  def change
    add_column :resources, :NumberOfPages, :integer
  end
end
