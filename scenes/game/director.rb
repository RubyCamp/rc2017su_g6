module Game
  class Director
    WALL_WIDTH = 10

    def initialize
      @space = CP::Space.new
      @space.gravity = CP::Vec2.new(0, 100)
      @speed = 1 / 60.0
      # World座標系の生成(画面外含めての大きなマップ)
      @rt = RenderTarget.new(4000, 2000)
      # 背景画像
      @background = Image.load('images/background.png')

      @objects = []

      stage = [
        # [始点のx, 始点のy, 幅, 高さ]
        [0, 0, WALL_WIDTH, Window.height-WALL_WIDTH],
      ]

      # 壁の生成と登録
      stage.each do |st|
        add_obj(Wall.new(st[0], st[1], st[2], st[3]))
      end

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
end
