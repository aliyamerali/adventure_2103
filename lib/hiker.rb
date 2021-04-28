class Hiker
  attr_reader :name, :experience_level, :snacks

  def initialize(name, experience_level)
    @name = name
    @experience_level = experience_level
    @snacks = {}
  end

  def pack(snack, amount)
    if @snacks[snack].nil?
      @snacks[snack] = amount
    else
      @snacks[snack] += amount
    end
  end

end
