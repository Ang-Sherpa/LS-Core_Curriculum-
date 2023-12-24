class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'  # Fluffy
fluffy = Pet.new(name) #new pet object with 'Fluffy' as name
puts fluffy.name # Fluffy
puts fluffy # My name is FLUFFY
puts fluffy.name # FLUFFY
puts name # FLUFFY