require 'csv'

module RideShare
  class Rider
    attr_accessor :rider_id, :name, :phone_num

    def initialize(rider_id, name, phone_num)
      @rider_id = rider_id
      @name = name
      @phone_num = phone_num
    end

    # retrieve the list of trip instances that only this rider has taken
    def rider_trip_instances
      rider_trips = RideShare::Trip.all_rider_trip_instances(@rider_id)
      return rider_trips
    end

    # retrieve the list of all previous driver instances (through the trips functionality built above)
    def previous_driver_trips
      driver_list = []
      rider_trips = RideShare::Trip.all_rider_trip_instances(@rider_id)#does this mean i need to make a self method of rider trip instances?
      rider_trips.each do |object|
        driver_list << object.driver_object
      end
      return driver_list
    end

    # retrieve all riders from the CSV file
    def self.all_rider_info
      all_rider_info = []
      CSV.read('support/riders.csv').each do |object|
        rider_id = object[0].to_i
        name = object[1].to_s
        phone_num = object[2].to_s
        #note to self: I do this below so that I can actually do something with the variables
        a_ride = RideShare::Rider.new(rider_id, name, phone_num)
        all_rider_info << a_ride
      end
      return all_rider_info
    end

    # find a specific rider using their numeric ID
    def self.find_rider(rider_id)
      all_riders = RideShare::Rider.all_rider_info
      all_riders.each do |object|
        if object.rider_id == rider_id
          return object
        end
      end
      raise ArgumentError.new("Rider #{rider_id} does not exist")
    end


  end
end
