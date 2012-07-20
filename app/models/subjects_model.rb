class Subjects < ActiveRecord::Base
   validates :name, :presence => true
   validates :student_id, :presence => true

   has_many :assignments, :dependent => :destroy
   has_many :resources
   belongs_to :student

   validates_associated :assignments
end

