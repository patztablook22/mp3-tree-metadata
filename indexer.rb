#!/usr/bin/env ruby

# get track number and song name from the filename
def query_metadata filename
  song = File.basename(filename, File.extname(filename))
  track = filename[/[0-9]+ /]

  unless track.nil?
    song  = song[track.size .. -1]
    track = track.to_i
  end

  return track,song
end

def update_metadata filename, artist, album = nil
  track,song = query_metadata(filename)
  album ||= song   # if song doesn't have album specified, IT IS album
  command =<<END
id3v2 \
  --song   "#{song  }" \
  --artist "#{artist}" \
  --album  "#{album }" \\
END
  command << "--track \"#{track}\" " unless track.nil?
  command << " \"#{filename}\""

  system(command)
end

=begin 
# some testing
pp query_metadata 'Chick Corea/Light as a Feather/06 Spain.mp3'
pp query_metadata 'Alpha Mist/Antiphon.mp3'
pp query_metadata 'Sunn O)))/HELL-O))).mp3'
=end

if ARGV.size != 1
  $stderr.puts 'argument must be mp3 tree root'
  exit 1
end

Dir.chdir ARGV[0]

# for all artists
Dir["*"].each do |artist|
  # for all albums stored on a single mp3
  Dir["#{artist}/*.mp3"].each do |album_mp3|
    update_metadata(
      album_mp3,
      artist,
    )
  end

  Dir["#{artist}/*/"].each do |album_dir|
    album = File.basename(album_dir)
    album_dir = album_dir[0...-1]
    Dir["#{album_dir}/*.mp3"].each do |song_mp3|
      update_metadata(
        song_mp3,
        artist,
        album,
      )
    end
  end

end
