class Hiker
  attr_reader :name,
              :experience_level,
              :snacks,
              :parks_visited,
              :park_visit_logs

  def initialize(name, experience_level)
    @name = name
    @experience_level = experience_level
    @snacks = {}
    @parks_visited = []
    @park_visit_logs = {}
  end

  def pack(snack, amount)
    if @snacks[snack].nil?
      @snacks[snack] = amount
    else
      @snacks[snack] += amount
    end
  end

  def favorite_snack
    favorite = @snacks.max_by do |snack, amount|
      amount
    end
    favorite[0]
  end

  def visit(park)
    if @park_visit_logs[Date.today].nil? #TO REFACTOR into helper method
      @park_visit_logs[Date.today] = [park]
    else
      @park_visit_logs[Date.today] << park
    end

    @parks_visited << park
    @parks_visited.uniq!
  end

  def possible_trails
    @parks_visited.reduce([]) do |possible_trails, park|
      possible_trails << park.trails.find_all do |trail|
        trail.level == experience_level
      end
      possible_trails.flatten
    end
  end

end
