# 線オブジェクト
class CPSegment < CPBase
  def initialize(x1, y1, x2, y2, r, opt = {})
    @r = r
    mass = opt[:mass] || 1  # 質量定義

    @v1 = CP::Vec2.new(x1, y1)
    @v2 = CP::Vec2.new(x2, y2)
    # 半径値から慣性モーメントを計算
    moment = CP::moment_for_segment(mass, @v1, @v2)

    # Bodyオブジェクト（性質）生成
    @body = CP::StaticBody.new
    @body.p = CP::Vec2.new(0, 0)

    # Shapeオブジェクト（形状）生成
    @shape = CP::Shape::Segment.new(@body, @v1, @v2, r)
    # Shapeに紐付ける画像を設定
    set_image(opt[:image])
  end

  # 描画
  def draw(rt)
    rt.draw_line(
      @v1.x,
      @v1.y,
      @v2.x,
      @v2.y,
      C_GREEN)
  end

  private

  # デフォルト画像の定義
  # CPBaseクラスで定義されている内容をオーバーライド。set_imageメソッドから呼ばれる
  def shape_default_image
    Image.new(@r * 2, @r * 2).circle_fill(@r, @r, @r,C_WHITE).line(0, @r, @r, @r, C_BLACK)
  end
end
