require 'dxruby'
require 'chipmunk'

require_relative 'lib/base/cp_base'
require_relative 'lib/base/cp_box'
require_relative 'lib/base/cp_circle'
require_relative 'lib/base/cp_static_box'

require_relative 'lib/wall'
require_relative 'lib/ball'
require_relative 'lib/box'

require_relative 'scene'
require_relative 'scenes/opening/director'
require_relative 'scenes/game/director'

Window.width = 640
Window.height = 480

Scene.add_scene(Opening::Director.new,  :opening)
Scene.add_scene(Game::Director.new,  :game)

Scene.set_current_scene(:opening)

Window.loop do
  break if Input.key_push?(K_ESCAPE)
  Scene.play_scene
end
