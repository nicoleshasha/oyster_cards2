class JourneyLog
  attr_reader :journeys, :history
  def initialize
    @journeys = []
    @history = {}
  end

  def start(entry_station)
    @current_journey = Journey.new(entry_station)
  end

  def end(exit_station)
    @current_journey.end(exit_station)
    @current_journey.journey
  end
end
