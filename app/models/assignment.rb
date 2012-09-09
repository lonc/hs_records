class Assignment < ActiveRecord::Base
  attr_accessible :assignment, :assigned, :date_assigned, :subject_id, :score, :watchfor, :materialsrequired, :notify_by, :studentupdate
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
      Assignment.update(alid, :assigned => 1)
    end
  end

#  def set_completed_date_to_now
#    self.date_completed = Time.now
#  end
end


