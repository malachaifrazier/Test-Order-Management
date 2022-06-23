FactoryBot.define do
  factory :order do
    # state
    control_number {rand(1..10000)}
  end
end
