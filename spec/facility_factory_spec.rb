require 'spec_helper'

RSpec.describe Facility do
    before(:each) do
        @facility_generator = FacilityFactory.new
        @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations  
        @facilities = @facility_generator.create_facilities(@co_dmv_office_locations)
    end
    describe '#initialize facility factory' do
        it 'creates a Facility Factory object' do

            expect(@facility_generator).to be_an_instance_of(FacilityFactory)
        end
    end

    describe '#create facilities' do
        it 'creates facilities and organizes API data' do
    
            expect(@facilities).to be_an(Array)
            expect(@facilities).not_to be_empty
            expect(@facilities.first).to be_a(Facility)
  
            @first_facility = @facilities.first
            expect(@first_facility.name).to eq("DMV Tremont Branch")
            expect(@first_facility.address).to eq("2855 Tremont Place")
            expect(@first_facility.phone).to eq("(720) 865-4600")
            expect(@first_facility.services).to eq("vehicle titles, registration, renewals;  VIN inspections")
            expect(@first_facility.registered_vehicles).to eq([])
            expect(@first_facility.collected_fees).to eq(0)
    end 
end




end