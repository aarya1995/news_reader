task :updatefeeds => :environment do
	FeedEntry.update_from_feed("http://feeds.bbci.co.uk/news/rss.xml")
	FeedEntry.update_from_feed("http://feeds.bbci.co.uk/news/world/rss.xml")
	FeedEntry.update_from_feed("http://feeds.bbci.co.uk/news/politics/rss.xml")
end