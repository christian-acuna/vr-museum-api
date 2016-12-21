# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ArtObject.delete_all
Medium.delete_all
Museum.delete_all
User.delete_all
Collection.delete_all

require 'cloudinary'
Cloudinary::Api.delete_all_resources()


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

getty = Museum.create(name:  "J. Paul Getty Museum", location: "1200 Getty Center Dr, Los Angeles, CA 90049", url: "https://www.getty.edu/museum/")

records.each do |record|
  medium = Medium.find_or_create_by(medium_type: record['Medium'])
  image_ending = record["imageThumbURI"].split('/').last
  large_image = getLargePicture(record["imageThumbURI"])

  result = Cloudinary::Uploader.upload(large_image)
  ap cloudinary_url = result["url"]

  ArtObject.create!(
    museum_id: getty.id,
    medium_id: medium.id,
    title: record["PrimaryTitle"],
    date: record["Date"],
    artist: record["MakerName"],
    # no description provided by this API
    dimensions: record["Dimensions"],
    thumbnail_url: record["imageThumbURI"],
    image_url: large_image,
    place: deletePlaceCreated(record["Place"]),
    link_to_object: record["recordLink"],
    vr_url: result["url"]
    # no credit line provided by this API
  )
end




def get_list_of_objects(page_num)
  options = { query: {
        key: "LweSAEeP",
        ps: "100",
        format: "json",
        imgonly: "true",
        toppieces: "true",
        p: page_num,
    } }
   HTTParty.get("https://www.rijksmuseum.nl/api/en/collection", options)
end

def get_art_object_info(object_number)
  options = { query: {
        key: "LweSAEeP",
        format: "json"
    } }

  HTTParty.get("https://www.rijksmuseum.nl/api/en/collection/#{object_number}", options)
end


def json_parser(art_object)
  JSON.parse(art_object)
end

rijksmuseum = Museum.create(name:  "Rijksmuseum", location: "Museumstraat 1, 1071 XX Amsterdam, Netherlands", url: "https://www.rijksmuseum.nl/en")

#
page_num = 0
while page_num < 1
  top_art_objects = get_list_of_objects(page_num)
  top_art_hash = top_art_objects["artObjects"]


  top_art_hash.each do |art_object|

    headerImage = ''
    if art_object["headerImage"] && art_object["headerImage"]["url"]
      headerImage = art_object["headerImage"]["url"]
    end

    object_number = art_object["objectNumber"]

    art_object_response = get_art_object_info(object_number)
    art_object_json = art_object_response["artObject"]


    date = ''


    if art_object_json["dating"]
      date = art_object_json["dating"]["year"] || art_object_json["dating"]["yearEarly"]
    end

    artist = ''

    if art_object_json["principalMakers"]
      artist = art_object_json["principalMakers"][0]['name']
    end

    description = ''
    if art_object_json["label"] && art_object_json["label"]["description"]
      description = art_object_json["label"]["description"]
    else
      description = art_object_json["description"]
    end

    medium = Medium.find_or_create_by(medium_type: art_object_json['physicalMedium'])
    image_url = art_object_json['webImage']['url']

    result = Cloudinary::Uploader.upload(image_url)
    ap cloudinary_url = result["url"]

      art_object = ArtObject.create!(
        medium_id:         medium.id,
        museum_id:         rijksmuseum.id,
        title:          art_object_json['title'],
        date:           date,
        artist:         artist,
        description:    description,
        dimensions:     art_object_json["subTitle"],
        thumbnail_url:  headerImage,
        image_url:      image_url,
        place:          art_object_json["classification"]["places"][0],
        link_to_object: art_object["links"]["web"],
        credit_line:    '',
        vr_url:         cloudinary_url
      )
  end
  page_num += 1

end

u = User.create(email:"pp@gmail.com",password:"123456",username:"pp")
mediums_array = ["Fresco", "softwood", "Oil on panel", "Oil on canvas"]
mediums_array.each do |medium|
  ap objects = Medium.find_by(medium_type: medium).art_objects
  ap primary_object = objects.first
  c = Collection.create(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, primary_object_id: primary_object.id, user:u)
  objects.each{|o| c.art_objects << o}
end

# u = User.create(email:"pp@gmail.com",password:"123456",username:"pp")
# c = Collection.create(title: "test", description:"optional", primary_object_id:2,user:u)
# objects.each{|o| c.art_objects << o}
