class FacilityFactory

    def initialize
    end    

    def create_facilities(office_locations)
        office_locations.map do |office_location|
            Facility.new(
                name: office_location[:dmv_office],
                address: office_location[:address_li],
                phone: office_location[:phone],
                services: office_location[:services_p]
            )
        end
    end 

end