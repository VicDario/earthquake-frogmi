class FeatureDataService
    USGS_URL = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson'

    def self.fetch_data
        response = HttpClient.get(USGS_URL)
        return response['features']
    end

    def self.process_geojson(geojson)
        features = []
        geojson.each do |raw_feature|
        feature = {
            external_id: raw_feature['id'],
            magnitude: raw_feature['properties']['mag'],
            place: raw_feature['properties']['place'],
            time: Time.at(raw_feature['properties']['time'] / 1000),
            tsunami: raw_feature['properties']['tsunami'] == 1,
            mag_type: raw_feature['properties']['magType'],
            title: raw_feature['properties']['title'],
            longitude: raw_feature['geometry']['coordinates'][0],
            latitude: raw_feature['geometry']['coordinates'][1],
            external_url: raw_feature['properties']['url'],
            kind: raw_feature['type'].downcase
        }
        features << feature
        end
        return features
    end
end