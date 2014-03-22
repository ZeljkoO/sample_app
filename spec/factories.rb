FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :micropost do
    content "Lorem ipsum"
    user
  end

  factory :production_parameter do
    production_cost "5"
    production_time "5"
    setup_cost "5"
    setup_time "5"
    holding_cost "5"
    initial_inventory "5"
    product
  end
end
