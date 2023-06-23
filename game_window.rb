# frozen_string_literal: true

require 'gosu'
require_relative 'tamagotchi'

# GAME WINDOW
class GameWindow < Gosu::Window
  def initialize
    super(400, 400, false)
    self.caption = 'Tamagotchi'

    @tamagotchi = Tamagotchi.new
    @font = Gosu::Font.new(20)
    @tamagotchi_image = create_tamagotchi_image
  end

  def update
    # Update Tamagotchi's states and needs
    if @tamagotchi.sleep
      @tamagotchi.fatigue += 1
    else
      @tamagotchi.hunger += 1
      @tamagotchi.fatigue += 1
      @tamagotchi.anxiety += 1
    end
  end

  def draw
    draw_rect(0, 0, width, height, Gosu::Colgor::BLACK)

    draw_text(@tamagotchi_image, 10, 10)

    # Draw Tamagotchi's current states
    draw_text("Hunger: #{@tamagotchi.hunger}", 10, 10)
    draw_text("Fatigue: #{@tamagotchi.fatigue}", 10, 30)
    draw_text("Sleeping: #{@tamagotchi.sleep}", 10, 50)
    draw_text("Anxiety: #{@tamagotchi.anxiety}", 10, 70)
  end

  def button_down(id)
    case id
    when Gosu::KB_S
      @tamagotchi.sleep ? @tamagotchi.wake_up : @tamagotchi.sleep
    when Gosu::KB_E
      @tamagotchi.eat
    when Gosu::KB_W
      @tamagotchi.walk
    when Gosu::KB_P
      @tamagotchi.play
    end
  end

  private

  def draw_text(text, x, y)
    @font.draw_text(text, x, y, 1, 1, 1, Gosu::Color::WHITE)
  end

  def create_tamagotchi_image
    <<~ASCII
      .- - - - - - -.
     |  _ _ _ _ _ _ |
     | |         | |
     | |  o   o  | |
     | |    >    | |
     |  |       |  |
     |   |     |   |
      |   `---'   |
       `._ _ _ _ .'
    ASCII
  end
end
