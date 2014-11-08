class Exchange

  include DataMapper::Resource
  property :id,           		Serial
  property :comm_status,        String
  property :visitor_phone,   	String
  
  has n, :messages
end
