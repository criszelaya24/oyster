require 'oystercard'
describe OysterCard do
	describe '#Balance' do
		#it {expect(subject).to respond_to :balance}
		it 'Expect that the init balance equal to 0' do
			expect(subject.balance).to eq 0
		end
	end

	describe '#top_up' do
		#it{is_expected.to respond_to(:top_up).with(1).argument}
		it 'Change the balance when we top up our card' do
			expect{subject.top_up(10)}.to change {subject.balance}.by 10
			# oystercard = OysterCard.new
			# oystercard.top_up(10)
			# expect(oystercard.balance).to eq 10
		end
		it 'Expect an error when is top up more than the limit' do
			subject.top_up(OysterCard::LIMIT)
			expect {subject.top_up(1)}.to raise_error 'Limit reached, you can not to up more than 90'
		end

		it 'Expect an error when is top up for first time and the amount is more than the limit' do
			expect {subject.top_up(91)}.to raise_error 'Limit reached, you can not to up more than 90'
		end
	end
end