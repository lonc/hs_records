class Student < ActiveRecord::Base
   attr_accessible :name, :email, :parent, :phone_h, :phone_c, :phone_w, :address, :city, :state, :zip, :birthdate
   validates :name, :presence => true
   validates :email, :presence => true
   validates :parent, :presence => true
   validates :address, :presence => true
   validates :city, :presence => true
   validates :state, :presence => true
   validates :zip, :presence => true
   validates :birthdate, :presence => true

   validate :phone_number_is_required

   has_many :subjects
   has_many :assignments, :through => :subjects 
   has_many :resources, :through => :subjects 


   def phone_number_is_required
      if phone_h.blank? and phone_c.blank? and
         phone_w.blank?
            errors.add(:phone_h, "must have at least one valid phone number")
      end
   end

   def self.daily_assignments (student, date)
     @today = date.wday
     @todays_assignments = Array.new
     @subs = student.subjects.order(:priority)
 
      @subs.each do |s| 
        @print = false
        case @today 
        when 1
          if s.AssignOnMonday == '1' 
            @print = true 
          end 
        when 2 
          if s.AssignOnTuesday == '1' 
            @print = true 
          end 
        when 3 
          if s.AssignOnWednesday == '1' 
            @print = true 
          end 
        when 4 
          if s.AssignOnThursday == '1' 
            @print = true 
          end 
        when 5 
          if s.AssignOnFriday == '1' 
            @print = true 
          end 
        end 
     
        if @print 
          @assignment = s.assignments.where("assigned != 1").first 
          if @assignment
            assign_h = {:subject => s.nickname, :assignment => @assignment.assignment, :id => @assignment.id}
            @todays_assignments.push(assign_h)
          end
        end 
      end
      return @todays_assignments
    end

end
