class FacilityFactory

    def initialize
    end    

    def create_co_facilities(office_locations)
        office_locations.map do |office_location|
            Facility.new(
                name: office_location[:dmv_office],
                address: build_full_address_co(office_location),
                phone: office_location[:phone],
                services: office_location[:services_p]
            )
        end
    end 
   
    def build_full_address_co(office_location)
        address_parts = []
        address_parts.push(
            office_location[:address_li],
            office_location[:address__1],
            office_location[:city],
            office_location[:state],
            office_location[:zip]
        )
        address_parts.compact.join(', ')
    end

    def create_ny_facilities(office_locations)
        office_locations.map do |office_location|
            Facility.new(
                name: office_location[:office_name],
                address: build_full_address_ny(office_location),
                phone: office_location[:public_phone_number],
            )
        end
    end 

    def build_full_address_ny(office_location)
        address_parts = []
        address_parts.push(
            office_location[:street_address_line_1],
            office_location[:city],
            office_location[:state],
            office_location[:zip_code]
        )
        address_parts.compact.join(', ')
    end

    def create_mo_facilities(office_locations)
        office_locations.map do |office_location|
            Facility.new(
                name: office_location[:name],
                address: build_full_address_mo(office_location),
                phone: office_location[:phone],
            )
        end
    end 

    def build_full_address_mo(office_location)
        address_parts = []
        address_parts.push(
            office_location[:address1],
            office_location[:city],
            office_location[:state],
            office_location[:zipcode]
        )
        address_parts.compact.join(', ')
    end


end