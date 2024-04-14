class Earthquake < ApplicationRecord
    self.inheritance_column = nil
    validates :magnitude, inclusion:
        { in: -1.0..10.0, message: "must be between -1.0 and 10.0" }
    validates :latitude, numericality:
        { greater_than_or_equal_to: -90.0, less_than_or_equal_to: 90.0, message: "must be between -90.0 and 90.0" }
    validates :longitude, numericality: 
        { greater_than_or_equal_to: -180.0, less_than_or_equal_to: 180.0, message: "must be between -180.0 and 180.0" }

    validates :title, :external_url, :place, :mag_type, :longitude, :latitude, presence: true
end
