require 'csv'
require_relative 'spec_helper'

describe "rider class" do

  it "requires three parameters for an instance of the rider class" do
    rider_id = 540
    name = "Bugs Bunny"
    phone_num = "206-230-9140"

    new_rider = RideShare::Rider.new(rider_id, name, phone_num)

    new_rider.must_respond_to :rider_id
    new_rider.rider_id.must_equal rider_id

    new_rider.must_respond_to :name
    new_rider.name.must_equal name

    new_rider.must_respond_to :phone_num
    new_rider.phone_num.must_equal phone_num
  end

  #for the self.all_rider_info method
  it "returns an array or all rider info" do
    test_class = RideShare::Rider.all_rider_info
    test_class.must_be_instance_of Array
  end

  #for self.find_rider(rider_info)
  it "returns a rider account that exists" do
    test_class = RideShare::Rider.find_rider(1)
    test_class.rider_id.must_equal 1
    test_class.name.must_equal "Nina Hintz Sr."
    test_class.phone_num.must_equal "560.815.3059"
  end

  it "can find the last rider that exists" do
    test_class = RideShare::Rider.find_rider(300)
    test_class.must_be_instance_of RideShare::Rider
    test_class.rider_id.must_equal 300
    test_class.name.must_equal "Miss Isom Gleason"
    test_class.phone_num.must_equal "791-114-8423 x70188"
  end

  it "raises an argument error if the driver doesn't exist" do
    proc { RideShare::Rider.find_rider(90493928) }.must_raise ArgumentError
  end

  #for rider_trip_instances
  it "returns an array of all trip instances for a paticular rider" do
    new_rider = RideShare::Rider.new(1, "Nina Hintz Sr.", "560.815.3059")
    new_rider.rider_trip_instances.must_be_instance_of Array
  end

  it "returns an array of all trip instances for a paticular rider" do
    new_rider = RideShare::Rider.new(13, "Dr. Leilani Mertz", "777.380.7540")
    new_rider.rider_trip_instances.must_be_instance_of Array
  end

  #for all previous driver instances
  it "returns an array of all driver objects" do
    new_rider = RideShare::Rider.new(120, "Andre Jerde", "(958) 349-8093 x50712")
    new_rider.previous_driver_trips.must_be_instance_of Array
  end

  it "returns an array of all trip instances for a paticular driver" do
    new_rider = RideShare::Rider.new(13, "Dr. Leilani Mertz", "777.380.7540")
    new_rider.rider_trip_instances.must_be_instance_of Array
  end


end
