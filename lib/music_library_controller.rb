class MusicLibraryController
  
  attr_accessor :path
  
  def initialize(path = './db/mp3s')
    @path = path
    file =  MusicImporter.new(path)
    file.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
    input = gets.chomp
    case input
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "list artist"
        self.list_songs_by_artist
      when "list genre"
        self.list_songs_by_genre
      when "play song"
        self.play_song
      when "exit"
        'exit'
      else
        call
      end
  end
  
  def library(klass = Song)
    lib = klass.all.collect {|item| item if item.class == klass }
    lib = lib.delete_if {|item| item == nil}
    lib.uniq
  end

  def list_songs
    lib = self.library.sort_by {|song|song.name}
    lib.each do |song|
      puts "#{lib.index(song) + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    
  end
  
end