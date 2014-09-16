
#highly inneffective. Remove this garbage once you find out a better way 
#to categorize stories
task :categorize => :environment do

	stories = FeedEntry.all

	stories.each do |story|

		if story.url.include? "news/world"
			story.category = "world"
			story.save!
		end
	end
end