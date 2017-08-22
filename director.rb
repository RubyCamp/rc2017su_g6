class Director
  WALL_WIDTH = 10 

  def initialize
    @space = CP::Space.new
    @space.gravity = CP::Vec2.new(0, 100)
    @speed = 1 / 60.0
    @objects = []

    # 壁の生成と登録
    wall_bottom = Wall.new(0, Window.height - WALL_WIDTH, Window.width, WALL_WIDTH)
    wall_left = Wall.new(0, 0, WALL_WIDTH, Window.height - WALL_WIDTH)
    wall_right = Wall.new(Window.width - WALL_WIDTH, 0, WALL_WIDTH, Window.height - WALL_WIDTH)
    add_obj(wall_bottom)
    add_obj(wall_left)
    add_obj(wall_right)

    # ボールの生成
    ball = Ball.new(40, Window.height-40, 15)
    add_obj(ball)
  end

  def play
    @space.step(@speed)
    @objects.each {|obj| obj.draw }
  end

  private

  def add_obj(obj)
    @objects << obj
    obj.add_to(@space)
  end
end
