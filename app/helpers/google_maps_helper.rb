# app/helpers/google_maps_helper.rb
module GoogleMapsHelper
  def google_maps_api_script_tag
    javascript_include_tag google_maps_api_source
  end

  def google_maps_api_source
    "https://maps.googleapis.com/maps/api/js?key=#{google_maps_api_key}&callback=initMap"
  end

  def google_maps_api_key
    Figaro.env.google_maps_api_key
  end

  def get_marker_date id, screen_name, name
    "<div id=#{id}><strong>#{screen_name}</strong><br/><strong>Title: </strong>#{name}</div>"
  end

  def my_location
    Figaro.env.moja_localizacja
  end
end
