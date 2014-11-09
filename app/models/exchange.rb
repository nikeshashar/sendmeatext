class Exchange

  include DataMapper::Resource
  property :id,           		Serial
  property :comm_status,        String
  property :visitor_phone,   	String
  property :instance_id,		Integer
  
  has n, :messages
  belongs_to :instance
end
