class Station

  attr_accessor :name

  def initialize(attributes)
    @name = attributes[:name]
  end

  def self.all
    []
  end

end
