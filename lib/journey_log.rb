require_relative 'journey.rb'

class JourneyLog

  attr_reader :current_journey

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @current_journey = nil
    @journey_history = []
  end

#@journey.entry_station = entry_station
  def start(entry_station)
    if @current_journey
      fare = finish(nil)
      @current_journey = journey_class.new(entry_station)
      return fare
    else
      @current_journey = journey_class.new(entry_station)
      return 0
    end
  end

  def finish(exit_station)
    @current_journey ||= journey_class.new
    @current_journey.set_exit_station(exit_station)
    @journey_history << current_journey

    fare = @current_journey.fare
    @current_journey = nil
    fare
  end

  def journeys
    @journey_history.dup
  end

  def print_journey_history
    @journey_history.to_s
  end

  private

  attr_reader :journey_class

end
