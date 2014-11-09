class Instance

include DataMapper::Resource

  # This block describes what resources our model will have
  property :id,           					Serial
  property :twilio_id,         				String
  property :site_owner_phone_number,         String


  has n, :exchanges


end