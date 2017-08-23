class Box < CPBox
  def initialize(x, y, w, h, opt = {})
    super
    self.shape.e = opt[:shape_e] || 1.0
    self.shape.u = opt[:shape_u] || 0.0
  end
end
