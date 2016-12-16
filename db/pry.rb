require "HTTParty"
def get_art_object_info(object_number)
  options = { query: {
        key: "LweSAEeP",
        format: "json"
    } }

  HTTParty.get("https://www.rijksmuseum.nl/api/en/collection/#{object_number}", options)
end


art_object_json = get_art_object_info("BK-KOG-656")
