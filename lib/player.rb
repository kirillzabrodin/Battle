class Player

  DEFAULT_HIT_POINTS = 60

  attr_reader :name, :hitpoints

  def initialize(name)
    @name = name
    @hitpoints = DEFAULT_HIT_POINTS
  end

  def receive_damage
    @hitpoints -= 10
  end

  def dead?
    @hitpoints <= 0
  end
end
