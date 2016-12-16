# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Medium.delete_all
Museum.delete_all
ArtObject.delete_all

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
#
# admin = User.create(username: 'cillin',email: 'collin@mail',password: 'password1')
#
# 10.times do
#   User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Internet.password)
# end
#
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

      art_object = ArtObject.create!(
        medium_id:         medium.id,
        museum_id:         rijksmuseum.id,
        title:          art_object_json['title'],
        date:           date,
        artist:         artist,
        description:    description,
        dimensions:     art_object_json["subTitle"],
        thumbnail_url:  headerImage,
        image_url:      art_object_json['webImage']['url'],
        place:          art_object_json["classification"]["places"][0],
        link_to_object: art_object["links"]["web"],
        credit_line:    ''
      )
  end
  page_num += 1

end
