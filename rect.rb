Rect = Struct.new(:x1, :x2, :y1, :y2) do
  def contains?(x, y)
    x1 < x &&
      x2 > x &&
      y1 < y &&
      y2 > y
  end

  def collide?(other)
    other.contains?(x1, y1) ||
      other.contains?(x2, y1) ||
      other.contains?(x1, y2) ||
      other.contains?(x2, y2) ||
      contains?(other.x1, other.y1) ||
      contains?(other.x2, other.y1) ||
      contains?(other.x1, other.y2) ||
      contains?(other.x2, other.y2) ||
      aligned?(other)
  end

  def aligned?(other)
    (x1 < other.x1 && x2 > other.x1 && y1 == other.y1 && y2 == other.y2) ||
    (x1 < other.x2 && x2 > other.x2 && y1 == other.y1 && y2 == other.y2) ||
    (x1 == other.x1 && x2 == other.x2 && y1 < other.y1 && y2 > other.y1) ||
    (x1 == other.x1 && x2 == other.x2 && y1 < other.y2 && y2 > other.y2)
  end
end
