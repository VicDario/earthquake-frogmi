require "test_helper"

class FeatureTest < ActiveSupport::TestCase
  test "create record successfully" do
    feature = Feature.new(
      external_id: 'nctest',
      external_url: 'https://www.test.com',
      title: 'M 1.3 - 7 km NW of The Geysers, CA',
      place: '7 km NW of The Geysers, CA',
      mag_type: 'md',
      kind: 'feature',
      magnitude: 2.0,
      longitude: -122.8130035,
      latitude: 38.8203316,
      tsunami: false,
    )
    assert_instance_of Feature, feature, "Record is not an instance of Feature"
    assert feature.valid?, "Record was not valid. Errors: #{feature.errors.full_messages.join(", ")}"
  end

  test "title is necessary" do
    feature = Feature.new
    assert_not feature.valid?, "Record was valid without title"
    assert_includes feature.errors.full_messages, "Title can't be blank"
  end

  test "place is necessary" do
    feature = Feature.new
    assert_not feature.valid?, "Record was valid without place"
    assert_includes feature.errors.full_messages, "Place can't be blank"
  end

  test "mag_type is necessary" do
    feature = Feature.new
    assert_not feature.valid?, "Record was valid without mag_type"
    assert_includes feature.errors.full_messages, "Mag type can't be blank"
  end

  test "magnitude is should be between -1.0 and 10.0" do
    feature = Feature.new
    assert_not feature.valid?, "Record was valid without magnitude"
    assert_includes feature.errors.full_messages, "Magnitude must be between -1.0 and 10.0"

    feature.magnitude = -1.1
    assert_not feature.valid?, "Record was valid with magnitude -1.1"

    feature.magnitude = 10.1
    assert_not feature.valid?, "Record was valid with magnitude 10.1"
  end

  test "longitude is should be between -180.0 and 180.0" do
    feature = Feature.new
    assert_not feature.valid?, "Record was valid without longitude"
    assert_includes feature.errors.full_messages, "Longitude must be between -180.0 and 180.0"

    feature.longitude = -180.1
    assert_not feature.valid?, "Record was valid with longitude -180.1"

    feature.longitude = 180.1
    assert_not feature.valid?, "Record was valid with longitude 180.1"
  end

  test "latitude is should be between -90.0 and 90.0" do
    feature = Feature.new
    assert_not feature.valid?, "Record was valid without latitude"
    assert_includes feature.errors.full_messages, "Latitude must be between -90.0 and 90.0"

    feature.latitude = -90.1
    assert_not feature.valid?, "Record was valid with latitude -90.1"

    feature.latitude = 90.1
    assert_not feature.valid?, "Record was valid with latitude 90.1"
  end
end
