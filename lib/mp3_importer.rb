class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect do |file|
      file.gsub("#{path}/", "")
    end
  end

  # set an instance variable that is equal to all the possible paths that music can come in on

  def import
    files.each{ | file | Song.new_by_filename(file)}
  end

  # call the files method and loop through each file and create a new song from each filename




end
