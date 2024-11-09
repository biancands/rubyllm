class Dessert
  attr_accessor :name, :calories

  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    @calories < 200
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor

  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def delicious?
    @flavor.downcase != 'black licorice'
  end
end

# Example usage
dessert = Dessert.new("Cake", 350)
puts dessert.healthy? # => false
puts dessert.delicious? # => true

jellybean = JellyBean.new("Jelly Bean", 150, "Black Licorice")
puts jellybean.healthy? # => true
puts jellybean.delicious? # => false

jellybean2 = JellyBean.new("Jelly Bean", 500, "Strawberry")
puts jellybean2.healthy? # => false
puts jellybean2.delicious? # => true