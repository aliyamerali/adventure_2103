class Park
  attr_reader :name, :trails

  def initialize(name)
    @name = name
    @trails = []
  end

  def add_trail(trail)
    @trails << trail
  end

  def trails_shorter_than(length)
    @trails.find_all do |trail|
      trail.length < length
    end
  end

  def hikeable_miles
    @trails.sum do |trail|
      trail.length
    end
  end

  def trails_by_level
    trail_objects_by_level = @trails.group_by do |trail|
      trail.level
    end

    #REFACTOR: helper to get names from an array of trail objects?
    trail_objects_by_level.reduce({}) do |trail_names_by_level, hash_element_array|
      level = hash_element_array[0]
      trails = hash_element_array[1]
      trail_names_by_level[level] = trails.map do |trail|
        trail.name
      end
      trail_names_by_level
    end
  end
end
