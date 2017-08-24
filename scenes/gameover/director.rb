module GameOver
  class Director
    def initialize
      @image = Image.load('images/gameover.png')
    end

    def play
      Scene.set_current_scene(:opening) if Input.key_push?(K_SPACE)
      Window.draw(0, 0, @image)
    end
  end
end
