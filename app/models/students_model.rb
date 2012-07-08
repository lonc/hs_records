class Students < ActiveRecord::Base
   validates :name, :presence => true
   validates :email, :presence => true
   validates :parent, :presence => true
   validates :address, :presence => true
   validates :city, :presence => true
   validates :state, :presence => true
   validates :zip, :presence => true
   validates :birthdate, :presence => true

   has_many :subjects, :dependent => :destroy, :include => :assignments
   
   validates_associated :subjects

   validate
:phone_number_is_required


   def
phone_number_is_required
      if phone_h.blank? and phone_c.blank? and
         phone_w.blank?
            errors.add (:phone_h, "must have at least one valid phone number")
      end
   end
end
