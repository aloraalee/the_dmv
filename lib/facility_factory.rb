class FacilityFactory

    def initialize
    end    

    def create_co_facilities(office_locations)
        office_locations.map do |office_location|
            Facility.new(
                name: office_location[:dmv_office],
                address: office_location[:address_li],
                phone: office_location[:phone],
                services: office_location[:services_p]
            )
        end
    end 
   
    def create_ny_facilities(office_locations)
        office_locations.map do |office_location|
            Facility.new(
                name: office_location[:office_name],
                address: office_location[:street_address_line_1],
                phone: office_location[:public_phone_number],
            )
        end
    end 

    def create_mo_facilities(office_locations)
        office_locations.map do |office_location|
            Facility.new(
                name: office_location[:name],
                address: office_location[:address1],
                phone: office_location[:phone],
            )
        end
    end 

end