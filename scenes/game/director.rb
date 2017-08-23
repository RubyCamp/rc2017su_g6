class Director

  WALL_WIDTH = 10

  def initialize
    @space = CP::Space.new
    @space.gravity = CP::Vec2.new(0, 100)
    @speed = 1 / 60.0
    # World座標系の生成(画面がい含めての大きなマップ)
    @rt = RenderTarget.new(4000, 2000)
    # 背景画像
    @background = Image.load('images/background.png')

    @objects = []

    stage = [
      # [始点のx, 始点のy, 幅, 高さ]
      # @rt.width, @rt.height
      [500, 400, 200, Window.height- WALL_WIDTH],
      [500, 200, 10, Window.height- WALL_WIDTH],
      [700, 300, 30, Window.height- WALL_WIDTH],
      [800, 700, 10, Window.height- WALL_WIDTH],
      [910, 300, 50, Window.height- WALL_WIDTH],
      [1000, 500, 300, Window.height- WALL_WIDTH],
      [1120, 300, 700, Window.height- WALL_WIDTH],
      [1200, 200, 30, Window.height- WALL_WIDTH],
      [1700, 202, 30, Window.height- WALL_WIDTH],
      [1850, 200, 30, Window.height- WALL_WIDTH],
      [2000, 300, 30, Window.height- WALL_WIDTH],
      [2050, 480, 1000, Window.height- WALL_WIDTH],
      [2050, -600, 400, Window.height- WALL_WIDTH],
      [2380, -340, 30, Window.height- WALL_WIDTH],
      [2600, -300, 30, Window.height- WALL_WIDTH],
      [2650, 400, 30, Window.height- WALL_WIDTH],
      [2655, -500, 30, Window.height- WALL_WIDTH],
      [2680, 380, 400, Window.height- WALL_WIDTH],
      [2700, 200, 30, Window.height- WALL_WIDTH],
      [2800, 200, 30, Window.height- WALL_WIDTH],
      [2900, -300, 30, Window.height- WALL_WIDTH],
    ]
    # 壁の生成と登録
    stage.each { |st|
      add_obj(Wall.new(st[0], st[1], st[2], st[3]))
    }

    # ボールの生成
    ball = Ball.new(500, 100, 15)
    add_obj(ball)
  end

  def play
    @space.step(@speed)
    # 描画座標のオフセット
    @rt.ox += 1
    # 基本的にすべてrt.drawで描画
    @rt.draw(0, 0, @background)
    @objects.each {|obj| obj.draw(@rt)}
    # 最後にrtで描画したものをWindow.drawする
    Window.draw(0, 0, @rt)
  end

  def add_obj(obj)
    @objects << obj
    obj.add_to(@space)
  end
end
