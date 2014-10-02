namespace :scheduler do
	
    task :get_movies => :environment do

	address = URI("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/opening.json?limit=16&country=us&apikey=" + ENV["tomato_key"])

	http = Net::HTTP.new address.host, address.port
    request = Net::HTTP::Get.new address.request_uri
    response = http.request(request)

    result = JSON.parse(response.body)

    movies = result["movies"]

    movies.each do |movie|
    	if movie["ratings"]["critics_score"] > 80
            film = Movie.new(
    			:title => movie["title"],
    			:critics_score => movie["ratings"]["critics_score"],
    			:release_date => movie["release_dates"]["theater"]
    		)
            film.save
    	end
    end
	end

end