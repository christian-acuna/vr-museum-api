# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ArtObject.delete_all

require 'json'
getty = File.read('./db/getty.json')
data_hash = JSON.parse(getty)
records = data_hash["Response"]["doc"]["record"]

def getLargePicture(url)
  url.gsub(/(thumbnail)/, 'enlarge')
end

def deletePlaceCreated(place)
  if place == nil
    nil
  else
    place.gsub(/(Place Created: )/, '')
  end
end

records.each do |record|
  ArtObject.create!(
    museum_id: 1, #1 for everything from Getty?
    medium_id: 1, #1 for paintings? (these are all paintigs)
    title: record["PrimaryTitle"],
    date: record["Date"],
    artist: record["MakerName"],
  # no description provided by this API 
    dimensions: record["Dimensions"],
    thumbnail_url: record["imageThumbURI"],
    image_url: getLargePicture(record["imageThumbURI"]),
    place: deletePlaceCreated(record["Place"]),
    link_to_object: record["recordLink"],
  # no credit line provided by this API
  )
end



