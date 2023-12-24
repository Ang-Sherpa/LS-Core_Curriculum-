class Flight
  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# shouldn't allow users to make unwanted changes
# to @database_handle with a setter method
# way to protect the instance variable so your code
# doesn't break or raise errors as a result of 
# unnecessary changes