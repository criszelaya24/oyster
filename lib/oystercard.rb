class OysterCard
attr_reader :balance
DEFAULT_BALANCE = 0
LIMIT = 90
	def initialize(balance = DEFAULT_BALANCE, limit = LIMIT)
		@balance = balance
		@limit = limit
	end

	def top_up(amount)
		fail 'Limit reached, you can not to up more than 90' if full? || @balance + amount > @limit
		@balance += amount
	end

private

	def full?
		@balance >= @limit
	end
end