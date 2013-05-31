reload "rect.rb"

class Entity
  def draw(window)
    window.draw_quad(x1, y1, color, x2, y1, color, x2, y2, color, x1, y2, color)
  end

  def rect
    Rect.new(x1, x2, y1, y2)
  end
end
