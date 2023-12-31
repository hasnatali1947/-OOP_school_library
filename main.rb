require_relative 'app'

APP = App.new
APP.load_data

begin
  puts 'Welcome to School Library App!'

  loop do
    puts "\nPlease choose an option by entering a number:
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit"
    user_choice = gets.chomp.to_i

    case user_choice
    when 1
      APP.list_books
    when 2
      APP.list_people
    when 3
      APP.create_person
    when 4
      APP.create_book
    when 5
      APP.create_rental
    when 6
      APP.list_rentals_by_person_id
    when 7
      puts 'Thank you for using this app!'
      APP.save_data
      exit(0)
    else
      puts 'That is not a valid option'
    end
  end
rescue StandardError => e
  puts "An error occurred: #{e.message}"
  puts e.backtrace
end
