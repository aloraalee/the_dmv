require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 16)
    @registrant_3 = Registrant.new('Tucker', 15)
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#add serivces' do
    it 'can do vehicle registration' do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['Vehicle Registration'])
      expect(@facility_2.services).to eq([])
    end
  end

  describe '#registered vehicles' do
    it 'can register vehicles' do
      @facility_1.registered_vehicles
      expect(@facility_1.registered_vehicles). to eq []

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles). to eq([@cruz])

      @facility_2.register_vehicle(@bolt)
      expect(@facility_2.registered_vehicles). to eq([])
    end

    it 'can collect fees' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees). to eq(100)

      @facility_2.register_vehicle(@bolt)
      expect(@facility_2.collected_fees). to eq(0)

    end
  end

  describe '#update registration' do
    it 'can update registration date' do
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today)
    end

    it 'can update plate type' do 
      @facility_1.register_vehicle(@camaro)
      expect(@camaro.registration_date).to eq(Date.today)
      expect(@camaro.calculate_plate_type). to eq(:antique)

      @facility_1.register_vehicle(@bolt)
      expect(@bolt.registration_date).to eq(Date.today)
      expect(@bolt.calculate_plate_type). to eq(:ev)
    end
  end

  describe '#Update services' do
    it 'can administer written tests to registrants with permits' do

      expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)

      @facility_1.add_service('Written Test')
      expect(@facility_1.services).to eq(['Written Test'])
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)

      expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)
      @registrant_2.earn_permit
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(true)
    end
  end

  describe '#Update license data' do
    it 'can update written' do

      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data). to eq({:written=>true, :license=>false, :renewed=>false})
    end
  end

  describe ' @Update services' do
    it 'can administer road tests' do

      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      expect(@facility_1.services).to eq(['Written Test', 'Road Test']) 
      
      @facility_1.administer_written_test(@registrant_1)
      expect(@facility_1.administer_road_test(@registrant_1)).to eq(true)
    end
  end
    
  describe '#Update license data' do
    it 'can update license' do

        @facility_1.add_service('Written Test')
        @facility_1.add_service('Road Test')
        expect(@facility_1.services).to eq(['Written Test', 'Road Test']) 
        
        @facility_1.administer_written_test(@registrant_1)
        @facility_1.administer_road_test(@registrant_1)
        expect(@registrant_1.license_data). to eq({:written=>true, :license=>true, :renewed=>false})
      
    end
  end

  describe ' @Update services' do
    it 'can renew drivers licenses' do

      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Renew License')
      expect(@facility_1.services).to eq(['Written Test', 'Road Test', 'Renew License']) 
      
      @facility_1.administer_written_test(@registrant_1)
      expect(@facility_1.administer_road_test(@registrant_1)).to eq(true)
    end
  end
    
  describe '#Update license data' do
    it 'can update renewed' do

        @facility_1.add_service('Written Test')
        @facility_1.add_service('Road Test')
        @facility_1.add_service('Renew License')
        expect(@facility_1.services).to eq(['Written Test', 'Road Test', 'Renew License']) 
        
        @facility_1.administer_written_test(@registrant_1)
        @facility_1.administer_road_test(@registrant_1)
        @facility_1.renew_drivers_license(@registrant_1)
        expect(@registrant_1.license_data). to eq({:written=>true, :license=>true, :renewed=>true})
      
    end
  end




end
