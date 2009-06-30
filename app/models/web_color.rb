
class WebColor
  attr_accessor :id, :name, :value

  def initialize(id, name, value)
    @id = id
    @name = name
    @value = value
  end

  COLORS = [WebColor.new(0, 'verde', '#58DF37'), WebColor.new(1, 'violeta', '#7029DF'),
    WebColor.new(2, 'gris', '#A5ABA5'), WebColor.new(3, 'cyan', '#5ACFAC'),
    WebColor.new(4, 'azul', '#066FA5'), WebColor.new(5, 'naranja', '#DD7017'),
    WebColor.new(6, 'tranqui', '#297F17')
  ]

  def self.find(id)
    if id == :all
      WebColor::COLORS
    else
      WebColor::COLORS[id.to_i]
    end
  end


end