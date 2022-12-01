require "./tenant.rb"
require "./apartment.rb"
require "./building.rb"

class Base
  def process
    create_tenants
    create_appartments
    create_buildings
    add_tenants_to_apartments
    add_apartments_to_buiding
  end

  def add_tenants_to_apartments

    @karthika.add_tenant(@dundu)
    @snehalayam.add_tenant(@snehith)
    @abc.add_tenant(@nimitha)
    @abc.add_tenant(@shadil)
  end

  def add_apartments_to_buiding
    @galaxy.add_apartment(@karthika)
    @galaxy.add_apartment(@snehalayam)
    @skyline.add_apartment(@abc)
  end

  def create_tenants
    @snehith = Tenant.create("snehith", 30, 652)
    @dundu = Tenant.create("Dundu", 24, 839)
    @shadil = Tenant.create("shadil", 25, 662)
    @nimitha = Tenant.create("nimitha", 25, 752)
  end

  def create_appartments
    @karthika = Apartment.create(4, 3500, 1000, 3, 3)
    @snehalayam = Apartment.create(8, 500, 400, 1, 1)
    @abc = Apartment.create(6, 5000, 5000, 6, 4)
  end

  def create_buildings
    @skyline = Building.create("skyline")
    @galaxy = Building.create("galaxy")
  end
  
end