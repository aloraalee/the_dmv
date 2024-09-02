require 'spec_helper'

RSpec.describe Vehicle do
    before(:each) do
        @facility_generator = FacilityFactory.new
        @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations  
        #@facilities = @facility_generator.create_facilities(@co_dmv_office_locations)
    end
    describe '#initialize facility factory' do
        it 'creates a Facility Factory object' do

            expect(@facility_generator).to be_an_instance_of(FacilityFactory)
        end
    end
end