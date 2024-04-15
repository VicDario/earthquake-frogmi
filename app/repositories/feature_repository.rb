class FeatureRepository
    def self.save_ignoring_duplicates(features_data)
        Feature.insert_all(features_data, unique_by: :external_id)
    end

    def self.paginate(page:, per_page:)
        offset = (page - 1) * per_page
        features = Feature.limit(per_page).offset(offset)
        features.map(&:serialize)
    end

    def self.paginate_by_mag_type(page:, per_page:, mag_types:)
        offset = (page - 1) * per_page
        features = Feature.where(mag_type: mag_types).limit(per_page).offset(offset)
        features.map(&:serialize)
    end

    def self.count
        Feature.count
    end

    def self.count_by_mag_type(mag_types)
        Feature.where(mag_type: mag_types).count
    end
end