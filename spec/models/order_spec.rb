require 'rails_helper'

# An order has a control number and a state.
# When the order is added to the system, it has a pending state.
# I want to be able to start the progress of an order.
# I want to be able to complete an order.
# I want to filter orders by number control and state.

# Invariants
# A pending order can only go to in progress state.
# An in progress order can only go to completed.
# Completed orders are done and should preserve its state.


RSpec.describe Order, type: :model do
  let!(:order) { FactoryBot.create(:order) }

  describe 'factory' do
    it 'has a valid factory' do
      expect(order).to be_valid
    end
  end

  context 'transistion states with initial state value' do
    it 'starts on existing state' do
      expect(order.state).to be_pending
    end

    it 'allows initialization to a valid next state' do
      expect(Order.new(state: 'in_progress')).to be_valid
    end

    it 'adds validation errors when initializing to an invalid state' do
      object = Order.new(state: 'banana')
      expect(object).not_to be_valid
      expect(object.errors[:state]).to match_array(['is not included in the list'])
    end

    it 'allows valid transitions' do
      expect(subject).to be_valid

      expect(subject.state.may_become?('in_progress')).to eq true
      expect(subject.state.next_values).to match_array(['in_progress'])
      expect(subject.state.previous_values).to be_empty

      expect { subject.start! }.to change { subject.state }.from('pending').to('in_progress')
      expect { subject.complete! }.to change { subject.state }.from('in_progress').to('complete')
      expect(subject).to be_valid
    end
  end

end
