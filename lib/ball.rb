class Ball < CPCircle
  def initialize(x, y, r, opt = {})
    super
    self.shape.e = opt[:shape_e] || 1.0
    self.shape.u = opt[:shape_u] || 0.0
  end

  def draw(rt)
    rt.draw_rot(
      @body.p.x - @r,
      @body.p.y - @r,
      @image,
      @body.a * 180.0 / Math::PI)
  end
end
