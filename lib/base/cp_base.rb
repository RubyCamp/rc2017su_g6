class CPBase
  attr_accessor :body, :shape, :width, :height

  def add_to(space)
    self.shape.add_to_space(space)
    self.body.add_to_space(space) unless self.body.class == CP::StaticBody # StaticBodyはspaceへ登録できないための条件づけ
  end

  private

  def set_image(img)
    if img
      @image = Image.load(img)
      @image.set_color_key([255, 255, 255])
    else
      @image = shape_default_image
    end
  end

  # このメソッドを、個別の形状クラス毎にオーバーライドする
  # NOTE: Rubyにおける「最後に評価された式の値が戻り値になる」という特徴を使っている
  def shape_default_image
    Image.new(width, height, C_WHITE)
  end
end
