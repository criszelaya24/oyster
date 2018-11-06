class OysterCard
attr_reader :balance, :reduct
DEFAULT_BALANCE = 0
LIMIT = 90
	def initialize(balance = DEFAULT_BALANCE, limit = LIMIT)
		@balance = balance
		@limit = limit
	end

	def top_up(amount)
		fail "Limit reached, you can not to up more than #{LIMIT}" if full? || @balance + amount > @limit
		@balance += amount
	end

	def reduct(amount)
		fail 'You do not have money inside to reduct from the card' if emty?
		@balance -= amount
	end

private

	def full?
		@balance >= @limit
	end

	def emty?
		@balance == 0
	end
end