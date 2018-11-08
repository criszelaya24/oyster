class OysterCard
attr_accessor :balance, :status, :entry_station
# CONSTANT
MINIMUN_AMOUNT = 1
DEFAULT_BALANCE = 0
LIMIT = 90

#Initiation Methods
	def initialize(balance = DEFAULT_BALANCE, limit = LIMIT, status = false)
		@balance = balance
		@limit = limit
		@status = status
	end

	def top_up(amount)
		fail "Limit reached, you can not to up more than #{LIMIT}" if full? || @balance + amount > @limit
		@balance += amount
	end

	def in_journey?
		!!@entry_station
	end

	def touch_in(station)
		fail 'Insufficient balance to touch in' if enough?
		@status = true
		@entry_station = station
	end

	def touch_out
		deduct(MINIMUN_AMOUNT)
		@status = false
		@entry_station = nil
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