class JourneyLog
  attr_reader :journeys, :history
  def initialize
    @journeys = []
    @history = {}
  end

end
