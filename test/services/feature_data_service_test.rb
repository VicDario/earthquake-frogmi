require "test_helper"

class FeatureDataServiceTest < ActiveSupport::TestCase
    test "GET Features data correctly" do
        data = FeatureDataService.fetch_data

        assert_instance_of Array, data, "Data is not an array"
        assert_not_empty data, "Data is empty"
        assert data.first.key?("properties"), "Data does not contain properties"
    end

  test "Process GeoJSON correctly" do
    feature_mock = {
        "id" => "us7000d3yv",
        "type" => "Feature",
        "properties" => {
            "mag" => 4.5,
            "place" => "10 km S of Guánica, Puerto Rico",
            "time" => 1610340730000,
            "tsunami" => 0,
            "magType" => "md",
            "title" => "M 4.5 - 10 km S of Guánica, Puerto Rico",
            "url" => "https://Feature.usgs.gov/earthquakes/eventpage/us7000d3yv"
        },
        "geometry" => {
            "coordinates" => [-66.919, 17.897, 10]
        }
    }
    features = FeatureDataService.process_geojson([feature_mock])

    assert_instance_of Array, features, "features is not an array"
    assert_not_empty features, "features is empty"
    assert_instance_of Hash, features.first, "Feature is not a hash"
    assert features.first.key?(:external_id), "Feature does not contain external_id"
    assert features.first.key?(:magnitude), "Feature does not contain magnitude"
    assert features.first.key?(:place), "Feature does not contain place"
    assert features.first.key?(:time), "Feature does not contain time"
    assert features.first.key?(:tsunami), "Feature does not contain tsunami"
    assert features.first.key?(:mag_type), "Feature does not contain mag_type"
    assert features.first.key?(:title), "Feature does not contain title"
    assert features.first.key?(:longitude), "Feature does not contain longitude"
    assert features.first.key?(:latitude), "Feature does not contain latitude"
    assert features.first.key?(:external_url), "Feature does not contain external_url"
  end

end
