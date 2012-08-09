class Resource < ActiveRecord::Base
   attr_accessible :title, :Publisher, :Author, :publication_date, :NumberOfPages
   validates :title, :presence => true
   validates :Publisher, :presence => true

   belongs_to :subjects
end

