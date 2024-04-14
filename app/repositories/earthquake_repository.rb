class EarthquakeRepository
    def self.save_earthquakes_ignoring_duplicates(earthquakes_data)
        Earthquake.insert_all(earthquakes_data, unique_by: :external_id)
    end

    def self.paginate_earthquakes(page:, per_page:)
        offset = (page - 1) * per_page
        earthquakes = Earthquake.limit(per_page).offset(offset)
        earthquakes.map(&:serialize)
    end

    def self.paginate_earthquakes_by_mag_type(page:, per_page:, mag_types:)
        offset = (page - 1) * per_page
        earthquakes = Earthquake.where(mag_type: mag_types).limit(per_page).offset(offset)
        earthquakes.map(&:serialize)
    end

    def self.count
        Earthquake.count
    end

    def self.count_by_mag_type(mag_types)
        Earthquake.where(mag_type: mag_types).count
    end
end