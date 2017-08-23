module Game
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

      stageA = [
        # [始点のx, 始点のy, 幅, 高さ]
        [500, 400, 200, Window.height-WALL_WIDTH],
        [500, 200, 10, Window.height-WALL_WIDTH],
        [700, 300, 30, Window.height-WALL_WIDTH],
        [800, 700, 10, Window.height-WALL_WIDTH],
        [910, 300, 50, Window.height-WALL_WIDTH],
        [1000, 500, 300, Window.height-WALL_WIDTH],
        [1120, 300, 700, Window.height-WALL_WIDTH],
        [1200, 200, 30, Window.height-WALL_WIDTH],
        [1700, 202, 30, Window.height-WALL_WIDTH],
        [1850, 200, 30, Window.height-WALL_WIDTH],
        [2000, 300, 30, Window.height-WALL_WIDTH],
        [2050, 480, 1000, Window.height-WALL_WIDTH],
        [2050, -600, 400, Window.height-WALL_WIDTH],
        [2380, -340, 30, Window.height-WALL_WIDTH],
        [2600, -300, 30, Window.height-WALL_WIDTH],
        [2650, 400, 30, Window.height-WALL_WIDTH],
        [2655, -500, 30, Window.height-WALL_WIDTH],
        [2680, 380, 400, Window.height-WALL_WIDTH],
        [2700, 200, 30, Window.height-WALL_WIDTH],
        [2800, 200, 30, Window.height-WALL_WIDTH],
        [2900, -300, 30, Window.height-WALL_WIDTH],
      ]
      stageB = [
        [0, 0, WALL_WIDTH, Window.height-WALL_WIDTH],	# 左壁
        [0, 480, 4000, 100],			# 地面
        [10, 400, 500, @rt.height-400],		# 510 # 右上の角に当たる
        [650, 400, 100, @rt.height-400],		# 750
        [800, 350, 30, @rt.height-350],		# 830
        [890, 300, 40, @rt.height-300],		# 空中
        [1000, 400, 200, @rt.height-400],	# 1200
        [1130, 340, 40, 40],			# 空中
        [1260, 430, 90, @rt.height-430],		# 1350
        [1400, 350, 50, @rt.height-350],		# 1450
        [1530, 400, 100, @rt.height-400],		# 1630
        [1700, 0, 70, 300],			# 1770	# 挟む上
        [1700, 335, 100, @rt.height-335],		# 1880	# 挟む下
        [1900, 300, 100, @rt.height-300],		# 2000
        [1970, 0, 20, 200],			# 上
        [2050, 350, 50, @rt.height-350],		# 2100
        [2150, 270, 20, @rt.height-270],		# 2170
        [2200, 0, 30, 10],
        [2300, 0, 70, 200],			# 	 # 挟む上
        [2250, 250, 100, 250],			# 	 # 挟む下
        [@rt.width-300, @rt.height-100, @rt.width, @rt.height]
        # [@rt.width-300, @rt.height-20, @rt.width, @rt.height],      
      ]

      stage = stageB

      # 壁の生成と登録
      stage.each { |st|
        add_obj(Wall.new(st[0], st[1], st[2], st[3]))
      }

      # ボールの生成
      ball = Ball.new(500, 100, 15)
      add_obj(ball)

      @first_x = 0
      @first_y = 0
      @end_x= 0
      @end_y= 0
    end

    def play
      if Input.mouse_push?(M_LBUTTON)
        @first_x = Input.mouse_pos_x - @rt.ox
        @first_y = Input.mouse_pos_y - @rt.oy
      end
      puts "first_x: #{@first_x}, first_y: #{@first_y}"
      if Input.mouse_release?(M_LBUTTON)
        @end_x = Input.mouse_pos_x - @rt.ox
        @end_y = Input.mouse_pos_y - @rt.oy

        @objects << CPStaticFloor.new(@first_x, @first_y, (@first_x - @end_x).abs, (@first_y - @end_y).abs, @space)
      end
      puts "end_x: #{@end_x}, end_y: #{@end_y}"

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
