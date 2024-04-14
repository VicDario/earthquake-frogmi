class EarthquakeRepository
    def self.save_earthquakes_ignoring_duplicates(earthquakes_data)
        Earthquake.insert_all(earthquakes_data, unique_by: :external_id)
    end
end