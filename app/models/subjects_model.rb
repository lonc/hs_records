class Subjects < ActiveRecord::Base
   validates :name, :presence => true
   validates :book_name, :presence => true
   validates :student_id, :presence => true

   has_many :assignments, :dependent => :destroy
   belongs_to :student

   validates_associated :assignments
end

