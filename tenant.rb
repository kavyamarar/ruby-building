class Tenant
  attr_reader :name, :age, :credit_score

  @@tenants = []

  def initialize(name, age, credit_score)
    @name = name
    @age = age
    @credit_score = credit_score
  end
  
  def self.create(name, age, credit_score)
    tenant = self.new(name, age, credit_score)
    @@tenants << tenant
    tenant
  end

  def self.all
    @@tenants
  end
  
  def credit_rating
    case credit_score
    when  760..840
      "excellent"
    when 725..759
      "great"
    when 660..724
      "good"
    when 560..659
      "mediocare"
    else
      "bad"
    end
  end
end