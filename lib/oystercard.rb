class OysterCard
attr_accessor :balance, :status
MINIMUN_AMOUNT = 1
DEFAULT_BALANCE = 0
LIMIT = 90
	def initialize(balance = DEFAULT_BALANCE, limit = LIMIT, status = false)
		@balance = balance
		@limit = limit
		@status = status
	end

	def top_up(amount)
		fail "Limit reached, you can not to up more than #{LIMIT}" if full? || @balance + amount > @limit
		@balance += amount
	end

	def reduct(amount)
		fail 'You do not have money inside to reduct from the card' if emty?
		@balance -= amount
	end

	def in_journey?
		@status
	end

	def touch_in
		fail 'Insufficient balance to touch in' if enough?
		@status = true
	end

	def touch_out
		@status = false
	end

private
	
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