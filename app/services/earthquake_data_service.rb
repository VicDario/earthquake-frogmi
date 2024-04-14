class EarthquakeDataService
    USGS_URL = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson'

    def self.fetch_data
        response = HttpClient.get(USGS_URL)
        return response['features']
    end

    def self.process_geojson(geojson)
        earthquakes = []
        geojson.each do |earthquake|
        earthquake_data = {
            external_id: earthquake['id'],
            magnitude: earthquake['properties']['mag'],
            place: earthquake['properties']['place'],
            time: Time.at(earthquake['properties']['time'] / 1000),
            tsunami: earthquake['properties']['tsunami'] == 1,
            mag_type: earthquake['properties']['magType'],
            title: earthquake['properties']['title'],
            longitude: earthquake['geometry']['coordinates'][0],
            latitude: earthquake['geometry']['coordinates'][1],
            external_url: earthquake['properties']['url']
        }
        earthquakes << earthquake_data
        end
        return earthquakes
    end
end