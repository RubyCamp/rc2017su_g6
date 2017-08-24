module Game
  class Director

    def initialize
      @space = CP::Space.new
      @space.gravity = CP::Vec2.new(0, 100)
      @speed = 1 / 60.0
      # World座標系の生成(画面外含めての大きなマップ)
      @rt = RenderTarget.new(4000, Window.height)
      # 背景画像
      @background = Image.load('images/background.png')

      # マウス座標の初期化
      @first_x, @first_y = 0, 0
      @end_x, @end_y = 0, 0

      @objects = []

      # stage.rbのグローバル変数参照
      stage = STAGE_A

      # 壁の生成と登録
      stage.each { |st|
        add_obj(Wall.new(st[0], st[1], st[2], st[3]))
      }

      # ボールの生成
      @ball = Ball.new(500, 100, 15)
      add_obj(@ball)

    end

    def play

      draw_floor()

      @space.step(@speed)

      # 描画座標のオフセット
      @rt.ox = @ball.body.p.x - 200
      # 基本的にすべてrt.drawで描画
      @rt.draw(0, 0, @background)
      @objects.each {|obj| obj.draw(@rt)}
      # 最後にrtで描画したものをWindow.drawする
      Window.draw(0, 0, @rt)
      # ゲームの終了条件
      if @ball.body.p.y > Window.height || @ball.body.p.y < 0
        Scene.set_current_scene(:gameover)
        Scene.add_scene(Game::Director.new,  :game)
      end

      if @ball.body.p.x > 3073
        Scene.set_current_scene(:gameclear)
        Scene.add_scene(Game::Director.new,  :game)
      end

    end

    def add_obj(obj)
      @objects << obj
      obj.add_to(@space)
    end

    def draw_floor 
      if Input.mouse_push?(M_LBUTTON)
        @first_x = Input.mouse_pos_x + @rt.ox
        @first_y = Input.mouse_pos_y + @rt.oy
      end

      if Input.mouse_release?(M_LBUTTON)
        @end_x = Input.mouse_pos_x + @rt.ox
        @end_y = Input.mouse_pos_y + @rt.oy
        add_obj(Segment.new(@first_x, @first_y, @end_x, @end_y, 2, :shape_e=>1.0))
      end
    end
  end
end
