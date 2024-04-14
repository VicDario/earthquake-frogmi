require "test_helper"

class EarthquakeTest < ActiveSupport::TestCase
  test "create record successfully" do
    earthquake = Earthquake.new(
      external_id: 'nctest',
      external_url: 'https://www.test.com',
      title: 'M 1.3 - 7 km NW of The Geysers, CA',
      place: '7 km NW of The Geysers, CA',
      mag_type: 'md',
      type: 'Feature',
      magnitude: 2.0,
      longitude: -122.8130035,
      latitude: 38.8203316,
      tsunami: false,
    )
    assert_instance_of Earthquake, earthquake, "Record is not an instance of Earthquake"
    assert earthquake.valid?, "Record was not valid. Errors: #{earthquake.errors.full_messages.join(", ")}"
  end

  test "title is necessary" do
    earthquake = Earthquake.new
    assert_not earthquake.valid?, "Record was valid without title"
    assert_includes earthquake.errors.full_messages, "Title can't be blank"
  end

  test "place is necessary" do
    earthquake = Earthquake.new
    assert_not earthquake.valid?, "Record was valid without place"
    assert_includes earthquake.errors.full_messages, "Place can't be blank"
  end

  test "mag_type is necessary" do
    earthquake = Earthquake.new
    assert_not earthquake.valid?, "Record was valid without mag_type"
    assert_includes earthquake.errors.full_messages, "Mag type can't be blank"
  end

  test "magnitude is should be between -1.0 and 10.0" do
    earthquake = Earthquake.new
    assert_not earthquake.valid?, "Record was valid without magnitude"
    assert_includes earthquake.errors.full_messages, "Magnitude must be between -1.0 and 10.0"

    earthquake.magnitude = -1.1
    assert_not earthquake.valid?, "Record was valid with magnitude -1.1"

    earthquake.magnitude = 10.1
    assert_not earthquake.valid?, "Record was valid with magnitude 10.1"
  end

  test "longitude is should be between -180.0 and 180.0" do
    earthquake = Earthquake.new
    assert_not earthquake.valid?, "Record was valid without longitude"
    assert_includes earthquake.errors.full_messages, "Longitude must be between -180.0 and 180.0"

    earthquake.longitude = -180.1
    assert_not earthquake.valid?, "Record was valid with longitude -180.1"

    earthquake.longitude = 180.1
    assert_not earthquake.valid?, "Record was valid with longitude 180.1"
  end

  test "latitude is should be between -90.0 and 90.0" do
    earthquake = Earthquake.new
    assert_not earthquake.valid?, "Record was valid without latitude"
    assert_includes earthquake.errors.full_messages, "Latitude must be between -90.0 and 90.0"

    earthquake.latitude = -90.1
    assert_not earthquake.valid?, "Record was valid with latitude -90.1"

    earthquake.latitude = 90.1
    assert_not earthquake.valid?, "Record was valid with latitude 90.1"
  end
end
