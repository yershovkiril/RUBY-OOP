
class Reader
  attr_accessor :name, :email, :city, :street, :house

  def initialize(name, options = {})
    @name = name
    @email = options[:email]
    @city = options[:city]
    @street = options[:sreet]
    @house = options[:house]
  end

end
