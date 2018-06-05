require 'google_places'

api_key = ENV['GOOGLE_PLACES_API_KEY']
client = GooglePlaces::Client.new(api_key)

kosen_coordinate = { longitude: 42.623426, latitude: 141.494643 }

around_kosen = client.spots(kosen_coordinate[:longitude], kosen_coordinate[:latitude], language: :ja)

around_kosen.each do |spot|
  puts '-' * 50
  puts "プレイスID: #{spot[:place_id]}"
  puts "名称: #{spot[:name]}"
  puts "座標: (#{spot[:lat]}, #{spot[:lng]})"
  puts "タイプ: #{spot[:types].to_s}"
  puts '-' * 50
end
