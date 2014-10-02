# Get twilio-ruby from twilio.com/docs/ruby/install

def find_favorites 
  @favorites = Favorite.pluck(:title, :theatre_release_date)
end

def send_message 

  require 'rubygems'          
  require 'twilio-ruby'
   
  # Get your Account Sid and Auth Token from twilio.com/user/account
  account_sid = 'AC7326a501d955b4b8090071e6d4d7ea1f'
  auth_token = '9e23410ee016bc59488c7d79e7a2c9df'
  @client = Twilio::REST::Client.new account_sid, auth_token
   
  message = @client.account.messages.create(
      :body => @favorites,
      :to => "+17032315273",
      :from => "+12027514370",
      )
  puts message.to

end