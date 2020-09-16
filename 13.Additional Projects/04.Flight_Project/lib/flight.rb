class Flight
    attr_reader :passengers
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end
    
    def full?
        return @passengers.length == @capacity
    end

    def board_passenger(passenger)
        @passengers << passenger if !self.full? && passenger.has_flight?(@flight_number)
    end
end