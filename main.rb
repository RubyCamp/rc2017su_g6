require 'dxruby'
require 'chipmunk'

require_relative 'director'

Window.width = 640
Window.height = 480

director = Director.new

Window.loop do
  break if Input.key_push?(K_ESCAPE)
  director.play
end
