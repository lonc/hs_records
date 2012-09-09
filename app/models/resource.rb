class Resource < ActiveRecord::Base
   attr_accessible :title, :Publisher, :publication_date, :NumberOfPages, :subject_id
   validates :title, :presence => true
   validates :Publisher, :presence => true

   belongs_to :subjects
end

