require 'zip'

class ArchivePhotosService
  attr_reader :photos

  def initialize(photos)
    @photos = photos
  end

  def call
    tmpfile = Tempfile.new("photos-#{Time.now}")

    Zip::OutputStream.open(tmpfile.path) do |stream|
      photos.each_with_index do |photo, index|
        filename = "%.2i_photo" %index
        stream.put_next_entry(filename)

        stream.write(photo.file.read)
      end
    end

    tmpfile
  end
end
