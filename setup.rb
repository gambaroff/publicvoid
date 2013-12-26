puts "Enter your db name"
dbname = gets
puts "Enter your db user"
user = gets
puts "Enter your db password"
password = gets
puts "Enter your db host"
host = gets

puts "writing config/database.yml..."

#1. Instantiate a file object, give it instructions
file = File.new('config/database.yml', 'w')
file.puts "production:"
file.puts "  adapter: postgresql"
file.puts "  database: #{dbname}"
file.puts "  username: #{user}"
file.puts "  password: #{password}"
file.puts "  host: #{host}"
file.close