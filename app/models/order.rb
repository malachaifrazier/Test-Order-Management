class Order < ApplicationRecord
  include SteadyState
  validates :control_number, uniqueness: true

  steady_state :state do
    state 'pending',     default: true
    state 'in_progress', from: 'pending'
    state 'complete',    from: 'in_progress'
  end

  def start
    with_lock { update(state: 'in_progress') }
  end

  def start!
    with_lock { update!(state: 'in_progress') }
  end

  def complete
    with_lock { update(state: 'complete') }
  end

  def complete!
    with_lock { update!(state: 'complete') }
  end
end
