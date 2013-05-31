reload "entity.rb"
reload "block.rb"
reload "rect.rb"

class Player < Entity
  attr_reader :x, :y, :velocity

  def initialize(x, y)
    @x = x
    @y = y
    @velocity = 0
  end

  def self.width
    Block.width
  end

  def width
    self.class.width
  end

  def self.height
    Block.height * 2
  end

  def height
    self.class.height
  end

  def x1
    x - (width/2)
  end

  def x2
    x + (width/2)
  end
  
  def y1
    y - (height/2)
  end

  def y2
    y + (height/2)
  end

  def color
    Gosu::Color::WHITE
  end

  def colliding?(e)
    rect.collide?(e.rect)
  end

  def move(moves, entities, gravity)
    filtered_entities = entities.reject{|e| e == self }

    if @velocity == 0 && ((moves.include?(:up) && gravity > 0) || (moves.include?(:down) && gravity < 0))
      @velocity = 8 * gravity
    end

    if moves.include?(:right)
      @x += 2
    end
    filtered_entities.each do |entity|
      if colliding?(entity)
        @x = entity.x1 - width/2
      end
    end

    if moves.include?(:left)
      @x -= 2
    end
    filtered_entities.each do |entity|
      if colliding?(entity)
        @x = entity.x2 + width/2
      end
    end

    @velocity -= (0.3 * gravity)
    @y -= @velocity.to_i

    filtered_entities.each do |entity|
      if colliding?(entity)
        if @velocity < 0
          @y = entity.y1 - height/2
        else
          @y = entity.y2 + height/2
        end
        @velocity = 0
      end
    end
  end
end
