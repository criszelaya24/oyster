class OysterCard
attr_accessor :balance, :status, :entry_station, :exit_station, :journeys
# CONSTANT
MINIMUN_AMOUNT = 1
DEFAULT_BALANCE = 0
LIMIT = 90

#Initiation Methods
	def initialize(balance = DEFAULT_BALANCE, limit = LIMIT, status = false, journeys = {})
		@balance = balance
		@limit = limit
		@status = status
		@journeys = journeys
	end

	def top_up(amount)
		fail "Limit reached, you can not to up more than #{LIMIT}" if full? || @balance + amount > @limit
		@balance += amount
	end

	def in_journey?
		!!@entry_station
	end

	def touch_in(entry_station)
		fail 'Insufficient balance to touch in' if enough?
		@status = true
		@entry_station = entry_station
		@journeys.store(:entry_station,@entry_station)
	end

	def touch_out(exit_station)
		deduct(MINIMUN_AMOUNT)
		@status = false
		@entry_station = nil
		@exit_station = exit_station
		@journeys.store(:exit_station,@exit_station)
	end

private

	def deduct(amount)
		@balance -= amount
	end

	def enough?
		@balance < MINIMUN_AMOUNT
	end

	def full?
		@balance >= @limit
	end

	def emty?
		@balance == 0
	end
end