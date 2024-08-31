require 'spec_helper'

RSpec.describe Vehicle do
    before(:each) do
        @factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations    
        @vehicles = @factory.create_vehicles(@wa_ev_registrations)
    end

    describe '#initialize vehicle factory' do
        it 'creates a Vehicle Factory object' do

            expect(@factory).to be_an_instance_of(VehicleFactory)
        end
    end

    describe '#create vehicles' do
        it 'creates vehicles and organizes API data' do
        
            expect(@vehicles).to be_an(Array)
            expect(@vehicles).not_to be_empty
            expect(@vehicles.first).to be_a(Vehicle)
      
            @first_vehicle = @vehicles.first
            expect(@first_vehicle.engine).to eq(:ev)
            expect(@first_vehicle.make).to eq("TESLA")
            expect(@first_vehicle.model).to eq("Model Y")
            expect(@first_vehicle.vin).to eq("5YJYGDED6M")
            expect(@first_vehicle.year).to eq(2021)
            expect(@first_vehicle.plate_type).to be_nil
            expect(@first_vehicle.registration_date).to be_nil
        end
    end
end