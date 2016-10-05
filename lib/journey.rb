class Journey
attr_reader :journey
  FINE = 6
  MINIMUM_FARE = 1

def initialize(entry_station)
  @journey = [entry_station]
  @journeys = []
  @history = {}
  @complete = false
end

  def end(exit_station)
    @journey << exit_station
    write_history
    @complete = true
  end

  def write_history
    @journeys << @journey.dup
    @history = Hash[@journeys.map.with_index(1) { |x, i| [i, x] }]
  end

  def complete?
    @complete
  end

  def fare
    return MINIMUM_FARE if complete?
    FINE
  end
end
