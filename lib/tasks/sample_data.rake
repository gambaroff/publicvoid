namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@example.org",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.transfers.create!(content: content) }
    end
  end
end