require 'oystercard'
describe OysterCard do
	describe '#Balance' do
		it {expect(subject).to respond_to :balance}
		it 'Expect that the init balance equal to 0' do
			expect(subject.balance).to eq 0
		end
	end

	describe '#top_up' do
		it{is_expected.to respond_to(:top_up).with(1).argument}
		it 'Change the balance when we top up our card' do
			expect{subject.top_up(10)}.to change {subject.balance}.by 10
			# oystercard = OysterCard.new
			# oystercard.top_up(10)
			# expect(oystercard.balance).to eq 10
		end
	end
end