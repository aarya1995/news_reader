task :updatefeeds => :environment do
	FeedEntry.update_from_feed("http://feeds.bbci.co.uk/news/rss.xml") # top
	FeedEntry.update_from_feed("http://feeds.bbci.co.uk/news/world/rss.xml") # world
	FeedEntry.update_from_feed("http://feeds.bbci.co.uk/news/politics/rss.xml") # politics
	FeedEntry.update_from_feed("http://feeds.bbci.co.uk/news/business/rss.xml") # business
	FeedEntry.update_from_feed("http://feeds.bbci.co.uk/news/technology/rss.xml") # tech
	FeedEntry.update_from_feed("http://feeds.bbci.co.uk/news/science_and_environment/rss.xml") # science
	FeedEntry.update_from_feed("http://feeds.bbci.co.uk/news/entertainment_and_arts/rss.xml") # entertainment
	FeedEntry.update_from_feed("http://feeds.bbci.co.uk/news/world/us_and_canada/rss.xml") # US and Canada
	FeedEntry.update_from_feed("http://feeds.bbci.co.uk/sport/0/rss.xml?edition=uk") # sports
end