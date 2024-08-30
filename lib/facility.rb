class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles,
              :collected_fees, :date

  def initialize(contact_info)
    @name = contact_info[:name]
    @address = contact_info[:address]
    @phone = contact_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services == ['Vehicle Registration']
      @registered_vehicles << vehicle
      @collected_fees += 100
    end
      vehicle.registration_date = Date.today
  end

  def administer_written_test(registrant)
    if @services == ['Written Test'] && registrant.permit? == true && registrant.age >= 16
      registrant.license_data[:written] = true
      true
    else
      false
    end
  end
end


        # require 'pry';binding.pry