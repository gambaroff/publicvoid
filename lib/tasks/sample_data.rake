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
      file = File.new(Rails.root + 'spec/support/ico.png')  
      upload = ActionDispatch::Http::UploadedFile.new(:tempfile => file, :filename => File.basename(file))  
      users.each { |user| user.transfers.create!(transferred_file: upload) }
    end
  end
end