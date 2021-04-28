class Trail
  attr_reader :name, :length, :level

  def initialize(info_hash)
    @name = info_hash[:name]
    @length = info_hash[:length].to_f
    @level = info_hash[:level]
  end

end
