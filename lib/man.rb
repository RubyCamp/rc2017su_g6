class Man < CPCircle
  DEFAULT_COLLISION_TYPE = 5
  attr_reader :body
  def initialize(x, y, r, opt = {})
    super
    self.shape.e = opt[:shape_e] || 1.0
    self.shape.u = opt[:shape_u] || 0.0
    self.shape.collision_type = opt[:collision_type] || DEFAULT_COLLISION_TYPE
  end

  def draw(rt)
    rt.draw_rot(
      @body.p.x - @r,
      @body.p.y - @r,
      @image,
      @body.a * 180.0 / Math::PI)
  end
end
