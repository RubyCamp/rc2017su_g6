# 円オブジェクト
class CPCircle < CPBase
  def initialize(x, y, r, opt = {})
    @r = r
    mass = opt[:mass] || 1  # 質量定義

    # 半径値から慣性モーメントを計算
    moment = CP::moment_for_circle(mass, 0, r, CP::Vec2.new(0, 0))

    # Bodyオブジェクト（性質）生成
    @body = CP::Body.new(mass, moment)
    @body.p = CP::Vec2.new(x + r, y + r)

    # Shapeオブジェクト（形状）生成
    @shape = CP::Shape::Circle.new(@body, r, CP::Vec2.new(0, 0))

    # Shapeに紐付ける画像を設定
    set_image(opt[:image])
  end


  private

  # デフォルト画像の定義
  # CPBaseクラスで定義されている内容をオーバーライド。set_imageメソッドから呼ばれる
  def shape_default_image
    Image.new(@r * 2, @r * 2).circle_fill(@r, @r, @r,C_WHITE).line(0, @r, @r, @r, C_BLACK)
  end
end
