class Assignment < ActiveRecord::Base
  attr_accessible :assignment, :assigned, :date_assigned, :subject_id, :score, :watchfor, :materialsrequired, :notify_by, :studentupdate, :sequence_id
  validates :assignment, :presence => true
  validates :subject_id, :presence => true

  belongs_to :subject

#  def completed_cannot_be_before_assigned
#    if !date_completed.blank? and
#       date_completed < date_assigned
#        errors.add(:date_completed, "can't be completed before assigned")
#    end
#  end

  def self.upd_assign (assign_list)
    assign_list.each do |alid|
      assign = Assignment.find(alid)
      sub_id = assign.subject_id
      @parent = Subject.find(sub_id)
      if @parent.repeating == false
        assign.update_attributes(:assigned => true)
      end
    end
  end

  def insert_assign (new_assign)
    @assign_list = Assignment.select("sequence_id, date_assigned").where("sequence_id > self.sequence_id AND subject_id == self.subject_id").order(:sequence_id)
    @current_assign = Assignment.find(self.id)
    @new_assign = Assignment.new
    @new_assign.assignment = new_assign.assignment
    @new_assign.watchfor = new_assign.watchfor
    @new_assign.materialsrequired = new_assign.materialsrequired
    @new_assign.notify_by = new_assign.notify_by
    @new_assign.sequence_id = @currrent_assign.sequence_id
    @new_assign.date_assigned = @currrent_assign.date_assigned
    @new_assign.save
    @assign_list.each do |asi|
      @current_assign.update_attributes(:sequence_id => asi.sequence_id, :date_assigned => asi.date_assigned)
      @current_assign = asi
    end
    @seq += 1
    @date += 1
    @current_assign.update_attributes(:sequence_id => @seq, :date_assigned => @date)
  end

    
#  def set_completed_date_to_now
#    self.date_completed = Time.now
#  end
end


