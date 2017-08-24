module Game
  class Director

    def initialize(stage_num)
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

      # 線のオブジェクトの集合
      @segments = []

      # stage.rbのグローバル変数参照
      @stages = [STAGE_A, STAGE_B]
      @stage_num = stage_num

      # 壁の生成と登録
      @stages[@stage_num].each { |st|
        add_obj(Wall.new(st[0], st[1], st[2], st[3]))
      }

      ENEMIES.each { |enemy|
        add_obj(Ball.new(enemy[0], enemy[1], enemy[2], :image => enemy[3]))
      }

      # 自機生成
      @man = Man.new(500, 100, 15, :image => 'images/character.png')
      add_obj(@man)

      #文字の描画
      @font = Font.new(32)

      #BGMの生成
      @sound = Sound.new('sound/BGM4.wav')
      @finish = true

      _set_collision_ball_and_item

    end

    def play

      draw_floor()

      #BGM再生
      if @finish
        @sound.play
        @finish = false
      end

      @space.step(@speed)

      # 描画座標のオフセット
      @rt.ox = @man.body.p.x - 200
      # 基本的にすべてrt.drawで描画
      @rt.draw(0, 0, @background)

      @objects.each {|obj| obj.draw(@rt)}
      @segments.each {|s| s.draw(@rt)}
      @rt.draw_font(2950,100,"ゴール",@font)
      # 最後にrtで描画したものをWindow.drawする
      Window.draw(0, 0, @rt)
      # ゲームの終了条件
      if @man.body.p.y > Window.height || @man.body.p.y < 0
        @sound.stop
        Scene.set_current_scene(:gameover)
        Scene.add_scene(Game::Director.new(0),  :game)
      end
      # ステージクリア
      if @man.body.p.x > 3073
        @sound.stop
        if @stage_num+1 < @stages.size
          Scene.add_scene(Game::Director.new(@stage_num+1),  :game)
          Scene.set_current_scene(:game)
        else
          Scene.set_current_scene(:gameclear)
          Scene.add_scene(Game::Director.new(0),  :game)
        end
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

        @segments << Segment.new(@first_x, @first_y, @end_x, @end_y, 1, :shape_e=>1.0)
        @segments.last.add_to(@space)
        if @segments.size >= 3
          @segments.first.shape.remove_from_space(@space)
          @segments.shift
        end
      end
    end

    def _set_collision_ball_and_item
      @space.add_collision_handler(Man::DEFAULT_COLLISION_TYPE, Segment::DEFAULT_COLLISION_TYPE) do | man, segment, arb|
        @space.add_post_step_callback(segment) do |_, shape|
          puts "collision!"
        end
      end
    end
  end
end
