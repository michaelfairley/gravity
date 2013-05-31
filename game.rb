require "gosu"

reload "player.rb"
reload "block.rb"

class Game < Gosu::Window
  def initialize
    super(WIDTH, HEIGHT, false)
    setup
  end

  def setup
    @entities = []
    @player = Player.new(200, 380)
    @entities << @player
    @gravity = 1

    (WIDTH/Block.width).times do |i|
      @entities << Block.new(i, HEIGHT/Block.height-1)
    end
    @entities << Block.new(8, HEIGHT/Block.height-2)
    @entities << Block.new(9, HEIGHT/Block.height-3)
    @entities << Block.new(9, HEIGHT/Block.height-2)


    (WIDTH/Block.width).times do |i|
      @entities << Block.new(i, 0)
    end
    @entities << Block.new(7, 1)
    @entities << Block.new(6, 2)
    @entities << Block.new(6, 1)
  end

  def update
    reload!

    @moves = []

    if button_down?(Gosu::KbLeft)
      @moves << :left
    end
    if button_down?(Gosu::KbRight)
      @moves << :right
    end
    if button_down?(Gosu::KbUp)
      @moves << :up
    end
    if button_down?(Gosu::KbDown)
      @moves << :down
    end
    @player.move(@moves, @entities, @gravity)
  end

  def draw
    @entities.each do |entity|
      entity.draw(self)
    end
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      close
    when Gosu::Window.char_to_button_id('r')
      setup
    when Gosu::Window.char_to_button_id('g')
      @gravity = -@gravity
    end
  end
end
