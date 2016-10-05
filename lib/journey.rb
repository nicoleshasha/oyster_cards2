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
    @complete = true
    write_history
  end

  def write_history
    @journeys << @journey.dup
    @history = Hash[@journeys.map.with_index(1) { |x, i| [i, x] }]
  end

  def complete?
    @complete
  end

  def fine
    FINE
  end

  def fare
    MINIMUM_FARE
  end
end
