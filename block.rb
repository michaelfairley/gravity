reload "entity.rb"

class Block < Entity
  attr_reader :gx, :gy

  def initialize(bx, by)
    @bx = bx
    @by = by
  end

  def x
    (@bx) * width + width/2
  end

  def y
    (@by) * height + height/2
  end

  def self.width
    40
  end

  def self.height
    40
  end

  def width
    self.class.width
  end

  def height
    self.class.height
  end

  def self.padding
    1
  end

  def padding
    self.class.padding
  end

  def x1
    x - (width/2) + padding
  end

  def x2
    x + (width/2) - padding
  end
  
  def y1
    y - (height/2) + padding
  end

  def y2
    y + (height/2) - padding
  end

  def color
    Gosu::Color::GRAY
  end
end
