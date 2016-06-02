
class Journey

  MINIMUM_FARE = 1
  MAXIMUM_FARE = 6

  attr_reader :entry_station, :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def fare
    return 0 unless (entry_station || exit_station)
    return MAXIMUM_FARE unless (entry_station && exit_station)
    MINIMUM_FARE + (entry_station.zone - exit_station.zone).abs
  end

  def set_entry_station(entry_station)
     @entry_station = entry_station
  end

  def set_exit_station(exit_station)
      @exit_station = exit_station
  end

end
