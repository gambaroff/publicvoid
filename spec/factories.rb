FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@pets.com"}
    password "petspets"
    password_confirmation "petspets"

    factory :admin do
      admin true
    end
  end

  factory :asset_transfer do
    # TODO how to add file here?
    user
  end
end