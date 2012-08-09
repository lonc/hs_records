class Assignment < ActiveRecord::Base
  attr_accessible :assignment, :assigned, :date_assigned, :completed, :score, :materialsrequired, :notifyby, :studentupdate, :subject_id
  validates :assignment, :presence => true
  validates :subject_id, :presence => true
  validate  :completed_cannot_be_before_assigned

  belongs_to :subject

  def completed_cannot_be_before_assigned
    if !date_completed.blank? and
       date_completed < date_assigned
        errors.add(:date_completed, "can't be completed before assigned")
    end
  end


end


