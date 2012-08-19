require "rubygems"
require "twitter"

#Authenticate
Twitter.configure do |config|
	config.consumer_key='mN5TT0ra7LpXsGMkfkQ'
	config.consumer_secret='lWEpKDsGbmF1XjBuVmfJblF9nqVKoOt4CQIlCOzRBYg'
	config.oauth_token='115593643-EaShhmsWjCBOhfRo8stx7M7ZL8b2c4eNyOwfRVCF'
	config.oauth_token_secret='bi06Qd9cfGa6LbrGVp3rMBxDWmCikh11g0SxlNK2qhc'
end
#Test
puts "Connecting to Twitter..."
myUser=Twitter.user("silencedrop")
if myUser.protected !=true
	puts "username :"+myUser.screen_name.to_s
	puts "Location :"+myUser.location
	puts "Connected"
end
rate_limit=Twitter.rate_limit
puts "rate limit: "+ rate_limit.limit.to_s
puts "rate remaining: "+rate_limit.remaining.to_s
puts "rate reset in: "+rate_limit.reset_in.to_s+" second"

#Check homeline
time_stamp=Twitter.home_timeline().first.id
while true do
	sleep(5)
	tweets=Twitter.home_timeline(:since_id=>time_stamp)
	if tweets.any?
		time_stamp=tweets.first.id
	end
	for tweet in tweets.reverse
		puts tweet.text
		#processing tweets
	end
end

