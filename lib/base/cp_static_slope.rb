class CPStaticSlope
  def initialize(x, y, w, h, space)
#   @x1, @y1 = 100, 100
    @x1, @y1 = x, y
    @x2, @y2 = 300, 300
#   @image = Image.new(w, h, C_WHITE)
    @image = Image.new(10, h, C_WHITE)
    @body = CP::StaticBody.new
    @body.p = CP::Vec2.new(0, 0)
    dx = 200
    verts = [
      CP::Vec2.new(x, y),         # 第１頂点（左上）
      CP::Vec2.new(x + dx, y + h),     # 第２頂点（左下）
      CP::Vec2.new(x + dx + w , y + h), # 第３頂点（右下）
      CP::Vec2.new(x + w, y)      # 第４頂点（右上）
    ]
#   verts = [
#     CP::Vec2.new(x, y),         # 第１頂点（左上）
#     CP::Vec2.new(x +dx, y + h),     # 第２頂点（左下）
#     CP::Vec2.new(x + dx + w , y + h), # 第３頂点（右下）
#     CP::Vec2.new(x + w, y)      # 第４頂点（右上）
#   ]
    @shape = CP::Shape::Poly.new(@body, verts, CP::Vec2.new(0, 0))
    @shape.e = 1.0
    @shape.u = 0.0
    @shape.add_to_space(space)
  end
  def draw
    @rad = Math.atan2(@y2 - @y1, @x2 - @x1)
    deg = ( @rad * 180.0 / Math::PI )
    @dst = Math.sqrt((@x2 - @x1) ** 2 + (@y2 - @y1) ** 2) # 三平方の定理により、コントロール矢印の大きさを得る
    opt = {
      angle: deg,
      center_x: 0,
      center_y: @image.height / 2,
      scale_x: @dst / @image.width.to_f
    }  
    Window.draw_ex(@body.p.x, @body.p.y - @image.height / 2, @image, opt)
  end
end