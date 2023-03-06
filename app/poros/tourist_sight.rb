class TouristSight
  attr_reader :name,
              :place_id,
              :address
              
  def initialize(data)
    @address = full_address(data[:address_line1], data[:address_line2])
    @name = data[:name]
    @place_id = data[:place_id]
  end

  def full_address(line_1, line_2)
    line_1 + " " + line_2
  end
end