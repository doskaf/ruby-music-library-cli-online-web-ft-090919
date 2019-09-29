class MusicLibraryController
  
  attr_accessor :path
  
  def initialize(path = './db/mp3s')
    @path = path
    file =  MusicImporter.new(path)
    file.import
  end
  
end