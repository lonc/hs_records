class Subject < ActiveRecord::Base
   attr_accessible :name, :graded, :studentupdate, :AssignOnMonday, :AssignOnTuesday, :AssignOnWednesday, :AssignOnThursday, :AssignOnFriday, :baseid, :student_id, :resource_id
   validates :name, :presence => true
   validates :baseid, :uniqueness => true

   belongs_to :students
   has_many :assignments, :dependent => :destroy
   has_many :resources

   validates_associated :assignments
end
