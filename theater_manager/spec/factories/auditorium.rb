FactoryBot.define do
  factory :auditorium do
    sequence(:name) { |n| "East #{n}" }
    sequence(:capacity) { |n| n+25 }
    is_imax_auditorium { true }
  end
end
