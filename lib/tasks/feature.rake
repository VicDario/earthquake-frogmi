namespace :feature do
  desc "It fetches the earthquakes features data from the USGS API and inserts it into the database."
  task fetch_and_insert_data: :environment do
    features_data = FeatureDataService.fetch_data
    features_data = FeatureDataService.process_geojson(features_data)
    FeatureRepository.save_ignoring_duplicates(features_data)
  end

end
