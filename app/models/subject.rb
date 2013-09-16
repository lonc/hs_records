class Subject < ActiveRecord::Base
   attr_accessible :name, :graded, :studentupdate, :AssignOnMonday, :AssignOnTuesday, :AssignOnWednesday, :AssignOnThursday, :AssignOnFriday, :student_id, :nickname, :base_id, :priority, :repeating
   validates :name, :presence => true

   belongs_to :students
   has_many :assignments, :dependent => :destroy
   has_many :resources

   validates_associated :assignments

   def get_next_assignment_date 
     @tmp = self.assignments.last
     if @tmp
       @last_date = @tmp.date_assigned
     else
       @last_date = nil
     end
     if @last_date == nil
       @last_date = Time.local(2013,9,13).to_date
     end
     if @last_date.monday?
       if self.AssignOnTuesday == '1'
        @next_date = @last_date + 1
       elsif self.AssignOnWednesday == '1'
        @next_date = @last_date + 2  
       elsif self.AssignOnThursday == '1'
        @next_date = @last_date + 3  
       elsif self.AssignOnFriday == '1'
        @next_date = @last_date + 4  
       else
        @next_date = @last_date + 7  
       end
     elsif @last_date.tuesday?
       if self.AssignOnWednesday == '1'
        @next_date = @last_date + 1
       elsif self.AssignOnThursday == '1'
        @next_date = @last_date + 2  
       elsif self.AssignOnFriday == '1'
        @next_date = @last_date + 3  
       elsif self.AssignOnMonday == '1'
        @next_date = @last_date + 6  
       else
        @next_date = @last_date + 7  
       end
     elsif @last_date.wednesday?
       if self.AssignOnThursday == '1'
        @next_date = @last_date + 1
       elsif self.AssignOnFriday == '1'
        @next_date = @last_date + 2  
       elsif self.AssignOnMonday == '1'
        @next_date = @last_date + 5  
       elsif self.AssignOnTuesday == '1'
        @next_date = @last_date + 6  
       else
        @next_date = @last_date + 7  
       end
     elsif @last_date.thursday?
       if self.AssignOnFriday == '1'
        @next_date = @last_date + 1
       elsif self.AssignOnMonday == '1'
        @next_date = @last_date + 4  
       elsif self.AssignOnTuesday == '1'
        @next_date = @last_date + 5  
       elsif self.AssignOnWednesday == '1'
        @next_date = @last_date + 6  
       else
        @next_date = @last_date + 7  
       end
     elsif @last_date.friday?
       if self.AssignOnMonday == '1'
        @next_date = @last_date + 3
       elsif self.AssignOnTuesday == '1'
        @next_date = @last_date + 4  
       elsif self.AssignOnWednesday == '1'
        @next_date = @last_date + 5  
       elsif self.AssignOnThursday == '1'
        @next_date = @last_date + 6  
       else
        @next_date = @last_date + 7  
       end
       @next_date = @next_date.to_time
     else
      @next_date = Time.local(2013,9,16).to_date 
     end
     return @next_date
   end

  def self.find_student_subject sub_id, sub_student
    id = Subject.where("base_id = ? AND student_id = ?", sub_id, sub_student)
  end

  def self.dup_assignments (src_id, dest_id, start_date, stop_date)
    subject_hash = Hash.new
    src_subject = Subject.find(src_id)
    dest_subject = Subject.find(dest_id)
    subject_hash = {:base_id => src_id, :nickname => src_subject.nickname}
    dest_subject.update_attributes(subject_hash)
    if src_subject.repeating
      src_assignments = src_subject.assignments.all
    else
      src_assignments = src_subject.assignments.where(:date_assigned => start_date..stop_date)
    end
    src_assignments.each do |assignment|
      new_assignment = assignment.dup
      new_assignment.save
      subject_h = {:subject_id => dest_id}
      new_assignment.update_attributes(subject_h)
    end
  end
end
