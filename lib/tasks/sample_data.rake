namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Ainah Pets",
                         email: "pets@pets.org",
                         password: "petspets",
                         password_confirmation: "petspets",
                         admin: true)
    users = User.all(limit: 6)
    50.times do
      file = File.new(Rails.root + 'spec/support/ico.png')  
      upload = ActionDispatch::Http::UploadedFile.new(:tempfile => file, :filename => File.basename(file))  
      users.each { |user| user.asset_transfers.create!(upload: upload) }
    end
  end
end