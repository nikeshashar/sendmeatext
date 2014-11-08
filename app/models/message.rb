class Message

  # this makes the instances of this class Datamapper resources
  include DataMapper::Resource

  # This block describes what resources our model will have
  property :id,           Serial
  property :text,         String
  property :time_stamp,   DateTime
  property :from_owner,   Boolean
  
  belongs_to :thread
  
end
