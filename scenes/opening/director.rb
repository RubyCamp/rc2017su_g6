module Opening
  class Director
    def initialize
      @image = Image.load('images/title.png')
    end

    def play
      Scene.set_current_scene(:game) if Input.key_push?(K_SPACE)
      Window.draw(0, 0, @image)
    end
  end
end
