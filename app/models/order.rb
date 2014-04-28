class Order < ActiveRecord::Base
  attr_accessible :email, :message, :name, :phone

   validates_length_of :name, :minimum => 4

   #validates_format_of :legacy_code, :with => /^([a-zA-Z0-9_\.\-])+@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/, :message => "Only letters allowed"

   #validates_as_phone_number :phone, :message => 'Invalid work phone number format', :allow_nil => false

   #validates :email, :email => true

   #validates_presense_of 



end
