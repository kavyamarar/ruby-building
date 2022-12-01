require "./tenant.rb"
require "./apartment.rb"

class Building
  class RecordNotFound < Exception
  end

  @@buildings = []

  attr_reader :address 
  attr_accessor :apartments

  def initialize(address)
    @address = address
    @apartments = []
  end

  def self.create(address)
    building = self.new(address)
    @@buildings << building
    building
  end


  def self.all
    @@buildings
  end

  def add_apartment(apartment)
    @apartments << apartment
  end

  def total_squre_footage
    total = 0 
    @apartments.each do |apartment|
      total += apartment.square_footage
    end
    total
  end

  def total_monthly_revanue
    @apartments.inject(0) { | sum, apartment | sum + apartment.rent }
  end

  def list_of_tenants
    @apartments.flat_map { |apartment| apartment.tenants}
  end

  def list_tenants
    tenants = []
    @apartments.each do |apartment|
      tenants += apartment.tenants
    end
    tenants
  end

  def remove_apartment_by_number(number)
    apartment_number = find_apartment_by_number(number)
    raise RecordNotFound.new "Number not found" if apartment_number.nil?
    @apartments.delete_if{ |apartment| apartment.number == number}
  end

  def apartment_credit_rating
    @apartment.group_by {|tenant| tenant.credit_rating }
  end

  def find_apartment_by_number(number)
    @apartments.find { |apartment| apartment.number == number}
  end
 

end