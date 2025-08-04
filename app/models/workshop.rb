class Workshop < ApplicationRecord
    has_many :appointments, dependent: :destroy

    # para busca por geolocalização depois
    scope :near, ->(latitude, longitude, distance) {
        where("ST_DWithin(ST_Point(longitude, latitude), ST_Point(?, ?), ?)", lng, lat, distance * 1000)
}
end
