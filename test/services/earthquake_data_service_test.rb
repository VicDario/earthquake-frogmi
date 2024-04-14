require "test_helper"

class EarthquakeDataServiceTest < ActiveSupport::TestCase
    test "GET Earthquake data correctly" do
        data = EarthquakeDataService.fetch_data

        assert_instance_of Array, data, "Data is not an array"
        assert_not_empty data, "Data is empty"
        assert data.first.key?("properties"), "Data does not contain properties"
    end

  test "Process GeoJSON correctly" do
    earthquake_mock = {
        "id" => "us7000d3yv",
        "type" => "Feature",
        "properties" => {
            "mag" => 4.5,
            "place" => "10 km S of Guánica, Puerto Rico",
            "time" => 1610340730000,
            "tsunami" => 0,
            "magType" => "md",
            "title" => "M 4.5 - 10 km S of Guánica, Puerto Rico",
            "url" => "https://earthquake.usgs.gov/earthquakes/eventpage/us7000d3yv"
        },
        "geometry" => {
            "coordinates" => [-66.919, 17.897, 10]
        }
    }
    earthquakes = EarthquakeDataService.process_geojson([earthquake_mock])

    assert_instance_of Array, earthquakes, "Earthquakes is not an array"
    assert_not_empty earthquakes, "Earthquakes is empty"
    assert_instance_of Hash, earthquakes.first, "Earthquake is not a hash"
    assert earthquakes.first.key?(:external_id), "Earthquake does not contain external_id"
    assert earthquakes.first.key?(:magnitude), "Earthquake does not contain magnitude"
    assert earthquakes.first.key?(:place), "Earthquake does not contain place"
    assert earthquakes.first.key?(:time), "Earthquake does not contain time"
    assert earthquakes.first.key?(:tsunami), "Earthquake does not contain tsunami"
    assert earthquakes.first.key?(:mag_type), "Earthquake does not contain mag_type"
    assert earthquakes.first.key?(:title), "Earthquake does not contain title"
    assert earthquakes.first.key?(:longitude), "Earthquake does not contain longitude"
    assert earthquakes.first.key?(:latitude), "Earthquake does not contain latitude"
    assert earthquakes.first.key?(:external_url), "Earthquake does not contain external_url"
  end

end
