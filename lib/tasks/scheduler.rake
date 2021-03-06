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
        			:release_date => movie["release_dates"]["theater"],
                    :poster_url => movie["posters"]["original"],
                    :synopsis => movie["synopsis"]
        		)
                film.save
        	end
        end
	end

    task :send_message => :environment do
        require 'rubygems'
        require 'twilio-ruby'

        movies = Movie.where(:created_at < :one_week_ago, :one_week_ago => Time.now - 7.days)
        movies_str = ""
        movies.each do |movie|
            movies_str += "#{movie["title"]}: #{movie["release_date"]}\n"
        end

        @baseUrl = "http://www.fandango.com/"
        users = User.all

        users.each do |user|
            number = "+1#{user.cell}"
            zipcode = user.zip

            text_body = "#{movies_str}#{@baseUrl}#{zipcode}_movietimes?q=#{zipcode}"
        
            @client = Twilio::REST::Client.new ENV["twillio_sid"], ENV["twillio_token"]
           
            message = @client.account.messages.create(
              :body =>  text_body,
              :to => number,
              :from => "+12027514370"
            ) 
        end
    
    end

end


