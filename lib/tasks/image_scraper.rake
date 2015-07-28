
task :getimg => :environment do

	require 'open-uri'
	
	#Ruby code 
	stories = FeedEntry.all

	stories.each do |story|
		
		if story.image.nil?

			url = story.url

			doc = Nokogiri::HTML(open(url))

			if doc.at_css(".full-width img")
				img = doc.at_css(".full-width img")[:src]
				story.image = img
				story.save!
			elsif doc.at_css(".body-width img")
				img = doc.at_css(".body-width img")[:src]
				story.image = img
				story.save!
			elsif doc.at_css(".body-narrow-width img")
				img = doc.at_css(".body-narrow-width img")[:src]
				story.image = img
				story.save!
			elsif doc.at_css(".caption img")
				img = doc.at_css(".caption img")[:src]
				story.image = img
				story.save!
			elsif doc.at_css(".cnnArticleGalleryPhotoContainer img")
				img = doc.at_css(".cnnArticleGalleryPhotoContainer img")[:src]
				story.image = img
				story.save!
			elsif doc.at_css(".cnn_strylftcntnt div img")
				img = doc.at_css(".cnn_strylftcntnt div img")[:src]
				story.image = img
				story.save!
			elsif doc.at_css(".cnn_stryimg640captioned img")
				img = doc.at_css(".cnn_stryimg640captioned img")[:src]
				story.image = img
				story.save!
			end
		else
			#do nothing
		end
	end
end