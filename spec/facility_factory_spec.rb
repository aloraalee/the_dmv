require 'spec_helper'

RSpec.describe Facility do
    before(:each) do
        @facility_generator = FacilityFactory.new
        @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations 
        @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations 
        @co_facilities = @facility_generator.create_co_facilities(@co_dmv_office_locations)
        @ny_facilities = @facility_generator.create_ny_facilities(@ny_dmv_office_locations)
    end

    describe '#initialize facility factory' do
        it 'creates a Facility Factory object' do

            expect(@facility_generator).to be_an_instance_of(FacilityFactory)
        end
    end

    describe '#create facilities' do
        it 'creates facilities and organizes API data' do
    
            expect(@co_facilities).to be_an(Array)
            expect(@co_facilities).not_to be_empty
            expect(@co_facilities.first).to be_a(Facility)
  
            @co_first_facility = @co_facilities.first
            expect(@co_first_facility.name).to eq("DMV Tremont Branch")
            expect(@co_first_facility.address).to eq("2855 Tremont Place")
            # The address info needs to be updated to contain the suits, city, state and zip 
            #from API data (if possible) to match the address info from the Facility class.
            expect(@co_first_facility.phone).to eq("(720) 865-4600")
            expect(@co_first_facility.services).to eq("vehicle titles, registration, renewals;  VIN inspections")
            expect(@co_first_facility.registered_vehicles).to eq([])
            expect(@co_first_facility.collected_fees).to eq(0)
    end 

    describe '#create facilities' do
        it 'creates facilities and organizes API data' do
    
            expect(@ny_facilities).to be_an(Array)
            expect(@ny_facilities).not_to be_empty
            expect(@ny_facilities.first).to be_a(Facility)
  
            @ny_first_facility = @ny_facilities.first
            expect(@ny_first_facility.name).to eq("HUNTINGTON")
            expect(@ny_first_facility.address).to eq("1815 E JERICHO TURNPIKE")
            # The address info needs to be updated to contain the suits, city, state and zip 
            #from API data (if possible) to match the address info from the Facility class.
            expect(@ny_first_facility.phone).to eq("7184774820")
            expect(@ny_first_facility.services).to eq([])
            expect(@ny_first_facility.registered_vehicles).to eq([])
            expect(@ny_first_facility.collected_fees).to eq(0)
        end
    end 
end




end