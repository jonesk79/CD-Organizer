require 'rspec'
require 'cd_organizer'

describe Cd do
  before do
    Cd.clear
  end

  it "creates a new instance of the Cd class with album name and artist" do
    test_Cd = Cd.new({:album_name => "Mylo Xyloto", :album_artist => "Coldplay"})
    test_Cd.should be_an_instance_of Cd
  end

  it "creates an array of all of a user's CDs" do
  test_cd = Cd.new({:album_name => "Mylo Xyloto", :album_artist => "Coldplay"})
  test_cd2 = Cd.new({:album_name => "The Jimi Hendrix Experience", :album_artist => "Jimi Hendrix"})
  Cd.all.length.should eq 2
  end

  it "clears the array of all CDs" do
    test_cd = Cd.new({:album_name => "Mylo Xyloto", :album_artist => "Coldplay"})
    test_cd2 = Cd.new({:album_name => "The Jimi Hendrix Experience", :album_artist => "Jimi Hendrix"})
    Cd.clear
    Cd.all.length.should eq 0
  end

  it "searches for a CD by album or artist" do
    test_Cd = Cd.new({:album_name => "Mylo Xyloto", :album_artist => "Coldplay"})
    test_Cd2 = Cd.new({:album_name => "The Jimi Hendrix Experience", :album_artist => "Jimi Hendrix"})
    test_cd3 = Cd.new({:album_name => "Viva la Vida", :album_artist => "Coldplay"})
    Cd.search("Mylo Xyloto").should eq ([test_Cd])
    Cd.search("Jimi Hendrix").should eq ([test_Cd2])
    Cd.search("Coldplay").should eq ([test_Cd, test_cd3])
  end

  it "displays all artists" do
    test_cd = Cd.new({:album_name => "Mylo Xyloto", :album_artist => "Coldplay"})
    test_Cd2 = Cd.new({:album_name => "The Jimi Hendrix Experience", :album_artist => "Jimi Hendrix"})
    test_cd3 = Cd.new({:album_name => "Viva la Vida", :album_artist => "Coldplay"})
    test_cd4 = Cd.new({:album_name => "The Richest Man In Babylon", :album_artist => "Thievery Corporation"})
    Cd.list_artists.should eq (["Coldplay", "Jimi Hendrix", "Thievery Corporation"])
  end
end
