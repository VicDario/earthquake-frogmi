namespace :earthquake do
  desc "It fetches the earthquake data from the USGS API and inserts it into the database."
  task fetch_and_insert_data: :environment do
    earthquake_data = EarthquakeDataService.fetch_data
    earthquake_data = EarthquakeDataService.process_geojson(earthquake_data)
    EarthquakeRepository.save_earthquakes_ignoring_duplicates(earthquake_data)
  end

end
