class Subject < ActiveRecord::Base
   attr_accessible :name, :graded, :studentupdate, :AssignOnMonday, :AssignOnTuesday, :AssignOnWednesday, :AssignOnThursday, :AssignOnFriday, :student_id
   validates :name, :presence => true

   belongs_to :students
   has_many :assignments, :dependent => :destroy
   has_many :resources

   validates_associated :assignments

   def get_next_assignment_date 
     @tmp = self.assignments.select("date_assigned").last
     if @tmp
       @last_date = @tmp.date_assigned
     end
     if @last_date == nil
       @next_date = Time.local(2012,2,29) 
     else
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
        @next_date = Time.local(2012,2,29) 
       end
     end
     return @next_date
   end
 end
