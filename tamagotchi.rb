class Tamagotchi
  attr_accessor :hunger, :fatigue, :sleep, :anxiety

  def initialize
    @hunger = 0
    @fatigue = 0
    @sleep = false
    @anxiety = 0
  end

  def sleep
    @sleep = true
    @fatigue = 0
  end

  def wake_up
    @sleep = false
  end

  def eat
    @hunger -= 1 if @hunger.positive?
  end

  def walk
    @anxiety -= 1 if @anxiety.positive?
  end

  def play
    @anxiety += 1
    @hunger += 1
    @fatigue += 1
  end
end
