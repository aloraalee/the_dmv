class ExternalVehicleDataWA
    attr_reader :vin,
    :year,
    :make,
    :model,
    :engine
    attr_accessor :registration_date, :plate_type

    def initialize(vehicle_details)
        @vin = vehicle_details[:vin]
        @year = vehicle_details[:year]
        @make = vehicle_details[:make]
        @model = vehicle_details[:model]
        @engine = vehicle_details[:engine]
        @registration_date = nil
    end


end