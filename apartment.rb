require "./tenant.rb"
class Apartment
  attr_reader :number, :rent, :square_footage, :number_of_bedrooms, :number_of_bathrooms
  attr_accessor :tenants

  @@apartments = []

  def initialize(number, rent, square_footage, number_of_bedrooms, number_of_bathrooms)
    @number = number
    @rent = rent
    @square_footage = square_footage
    @number_of_bathrooms = number_of_bathrooms
    @number_of_bathrooms = number_of_bathrooms
    @tenants = []
  end

  def self.create(number, rent, square_footage, number_of_bedrooms, number_of_bathrooms)
    return "already exist" unless find(number).nil?

    apartment = self.new(number, rent, square_footage, number_of_bedrooms, number_of_bathrooms)
    @@apartments << apartment
    apartment
  end

  def self.find(number)
    all.find { |apartment| apartment.number == number}
  end

  def self.all
    @@apartments
  end
  
  def add_tenant(tenant)
    member = find_tenant(tenant)
    return "Already added" unless member.nil?
    return "Member is not a tenant" unless tenant.is_a?(Tenant)
    return "Unable to add bad credit score" if tenant.credit_rating == "bad"
    
    @tenants << tenant
  end

  def members_count
    @tenants.length
  end

  def find_member_by_name(name)
    @tenants.find  { |tenant| tenant.name == name }
  end

  def find_members_start_with(letter)
    @tenants.select { | tenant | tenant.name.start_with?(letter) }
  end

  def find_tenant(given_tenant)
    @tenants.find { |tenant| tenant == given_tenant }
  end

  def remove_all_tenant
    @tenant.clear()
  end

  def remove_tenant_by_name(name)
     @tenants.delete_if{ |tenant| tenant.name == name }
  end

  def average_credit_score
    sum = 0
    @tenants.each do | tenant |
      sum += tenant.credit_score
    end
    sum/(@tenants.length)
  end

  def rating_credit(tenant)
  score = tenant.credit_score
  if score >= 760
    "excellent"
  elsif score >= 725
    "great"
  elsif score >= 660
    "good"
  elsif score >= 560
    "mediocre"
  else
    "bad"
  end 
end

end