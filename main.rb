require './lib/cd_organizer.rb'

def help
  puts "Press 'c' to create a new CD."
  puts "Press 'l' to list out all CDs."
  puts "Press 'a' to list out all artists."
  puts "Press 's' to search for a CD by album or artist name."
  puts "Press 'h' for help."
  puts "Press 'x' to exit."
end

def main_menu
  main_choice = gets.chomp
  case main_choice
  when 'c'
    create_cd
  when 'l'
    list_cds
  when 'a'
    list_all_artists
  when 's'
    search_menu
  when 'h'
    help
  when 'x'
    exit
  end
end

def list_cds
  Cd.all.each_with_index do |album, index|
  print (index + 1).to_s + ": " + album.instance_variable_get(:@album_name) + " by " + album.instance_variable_get(:@artist_name) + "\n"
  end
end

def list_all_artists
  Cd.list_artists
end

def create_cd
puts "Enter album name:"
user_album = gets.chomp
puts "Enter artist name:"
user_artist = gets.chomp

Cd.new({:album_name => user_album, :album_artist => user_artist})
puts "Album #{user_album} by #{user_artist} created!"
end

def search_menu
  puts "Press 'a' to search by album name"
  puts "Press 's' to search by artist name"
  puts "Press 'x' to return to the main menu"
  choice = gets.chomp

  case choice
  when 'a'
    puts "Enter album name to search for that album:"
    array = Cd.search(gets.chomp)
    array.each {|album| print album.instance_variable_get(:@album_name) + " by " + album.instance_variable_get(:@artist_name) + "\n"}
    search_menu
  when 's'
    puts "Enter an artist name to display all albums by that artist:"
    array = Cd.search(gets.chomp)
    array.each {|album| print album.instance_variable_get(:@album_name) + "\n"}
    search_menu
  when 'x'
    main_menu
  end
end

help
loop do
main_menu
end
