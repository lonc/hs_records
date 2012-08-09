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


   def phone_number_is_required
      if phone_h.blank? and phone_c.blank? and
         phone_w.blank?
            errors.add(:phone_h, "must have at least one valid phone number")
      end
   end
end
