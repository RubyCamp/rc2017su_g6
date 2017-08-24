WALL_WIDTH = 10
STAGE_A = [
  # [始点のx, 始点のy, 幅, 高さ]
  [500,   400,  200,  Window.height-WALL_WIDTH],
  [500,   200,  10,   Window.height-WALL_WIDTH],
  [700,   300,  30,   Window.height-WALL_WIDTH],
  [800,   700,  10,   Window.height-WALL_WIDTH],
  [910,   300,  50,   Window.height-WALL_WIDTH],
  [1000,  500,  300,  Window.height-WALL_WIDTH],
  [1120,  300,  700,  Window.height-WALL_WIDTH],
  [1200,  200,  30,   Window.height-WALL_WIDTH],
  [1700,  202,  30,   Window.height-WALL_WIDTH],
  [1850,  200,  30,   Window.height-WALL_WIDTH],
  [2000,  300,  30,   Window.height-WALL_WIDTH],
  [2050,  700,  1000, Window.height-WALL_WIDTH],
  [2050,  -600, 400,  Window.height-WALL_WIDTH],
  [2380,  -340, 30,   Window.height-WALL_WIDTH],
  [2600,  -300, 30,   Window.height-WALL_WIDTH],
  [2650,  400,  30,   Window.height-WALL_WIDTH],
  [2655,  -500, 30,   Window.height-WALL_WIDTH],
  [2680,  380,  400,  Window.height-WALL_WIDTH],
  [2700,  200,  30,   Window.height-WALL_WIDTH],
  [2800,  200,  30,   Window.height-WALL_WIDTH],
  [2900,  -300, 30,   Window.height-WALL_WIDTH],
]
 STAGE_B = [
  [0,     0,    WALL_WIDTH,   Window.height-WALL_WIDTH],	# 左壁
  # [0,     480, 3073, 100],                # 地面
  [10,    400,  500,  Window.height-400],
  [650,   400,  100,  Window.height-400],
  [800,   350,  30,   Window.height-350],
  [890,   300,  40,   Window.height-300],   # 空中
  [1000,  400,  200,  Window.height-400],
  [1130,  340,  40,   40],			            # 空中
  [1260,  430,  90,   Window.height-430],
  [1400,  350,  50,   Window.height-350],
  [1530,  400,  100,  Window.height-400],
  [1700,  0,    70,   285],			            # 挟む上
  [1700,  340,  100,  Window.height-335], 	# 挟む下
  [1900,  300,  100,  Window.height-300],	
  [1970,  0,    20,   200],			            # 上
  [2050,  350,  50,   Window.height-350],
  [2150,  270,  20,   Window.height-270],
  [2300,  0,    50,   145],			           	# 挟む上
  [2250,  200,  100,  Window.height-185], 	# 挟む下
  [2390,  100,  40,   40],
  [2430,  200,  40,   40],
  [2625,  300,  40,   40],
  [2700,  0,    100,  145],				          # 挟む上
  [2750,  200,  50,   Window.height-200],		# 挟む下
  [2900,  400,  3073-2900, Window.height-400],      
]

ENEMIES = [
  [700, 100, 15],
  [1000, 100, 15],
  [1300, 100, 15],
  [1600, 100, 15],
  [1900, 100, 15],
  [2200, 100, 15],
  [2500, 100, 15],
  [3100, 100, 15],
  [3600, 100, 15],
]
