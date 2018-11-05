require 'oystercard'
describe OysterCard do
	describe '#Balance' do
		it {expect(subject).to respond_to :balance}
		it 'Expect that the init balance equal to 0' do
			expect(subject.balance).to eq 0
		end
	end
end