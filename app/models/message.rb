class Message

  # this makes the instances of this class Datamapper resources
  include DataMapper::Resource

  # This block describes what resources our model will have
  property :id,           Serial
  property :dialog,       String
  property :time_stamp,   DateTime
  property :from_owner,   Boolean
  property :exchange_id,  Integer

  belongs_to :exchange



end
