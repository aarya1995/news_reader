
class FeedEntry < ActiveRecord::Base
 
 def self.update_from_feed(feed_url)
    
    #Feedjira::Feed.add_common_feed_entry_element("media:thumbnail", :value => :url,    :as => :image)
    
    feed = Feedjira::Feed.fetch_and_parse(feed_url)
  	
  	if feed_url.eql? "http://feeds.bbci.co.uk/news/world/rss.xml" #BBC World
        category = "world"
      	add_BBC_entries(feed.entries, category)
  	elsif feed_url.eql? "http://feeds.bbci.co.uk/news/politics/rss.xml" #BBC Politics
        category = "politics"
      	add_BBC_entries(feed.entries, category)
    elsif feed_url.eql? "http://feeds.bbci.co.uk/news/rss.xml" #BBC Top stories
        category = "top"
      	add_BBC_entries(feed.entries, category)
    #elsif feed_url.eql? "http://rss.cnn.com/rss/cnn_topstories.rss" #CNN top stories
        #add_cnn_top_entries(feed.entries)
    #elsif feed_url.eql? "http://rss.cnn.com/rss/cnn_world.rss" #CNN world stories
        #add_cnn_world_entries(feed.entries)
    #elsif feed_url.eql? "http://rss.cnn.com/rss/cnn_us.rss" #CNN U.S. stories
        #add_cnn_us_entries(feed.entries)
    #elsif feed_url.eql? "http://rss.cnn.com/rss/cnn_allpolitics.rss" #CNN politics stories
        #add_cnn_politics_entries(feed.entries)
    end

  end


 private

 #figure out how to refactor this logic into a few methods. Only major difference between
 #methods is the news source and the CATEGORY

 #----------------- BBC LOGIC --------------------#
  
  def self.add_BBC_entries(entries, category)
    entries.each do |entry|

      unless exists? :guid => entry.id
      	if entry.title.include? "VIDEO:"
      		#do nothing
        elsif entry.title.include? "AUDIO:"
          #do nothing
      	else
	        create!(
	          :name         => entry.title, 
	          :summary      => entry.summary,
	          :url          => entry.url,
	          :published_at => entry.published,
	          :guid         => entry.id,
	          :category 	=> category
	        )
		    end
      end
    end
  end

#---------------CNN Logic----------------------#
  def self.add_cnn_top_entries(entries)
    entries.each do |entry|

      unless exists? :guid => entry.id
        if entry.title.include? "VIDEO:"
          #do nothing
        elsif entry.title.include? "AUDIO:"
          #do nothing
        else
          #parsing the markup out of the story's summary using regex
          text = entry.summary
          description = entry.summary.to_s
          description.gsub!(/\<[^\>]+\>/m, "")
          
          create!(
            :name         => entry.title, 
            :summary      => description,
            :url          => entry.url,
            :published_at => entry.published,
            :guid         => entry.id,
            :category   => "top"
          )
        end
      end
    end
  end

  def self.add_cnn_us_entries(entries)
    entries.each do |entry|

      unless exists? :guid => entry.id
        if entry.title.include? "VIDEO:"
          #do nothing
        elsif entry.title.include? "AUDIO:"
          #do nothing
        else
          #parsing the markup out of the story's summary using regex
          text = entry.summary
          description = entry.summary.to_s
          description.gsub!(/\<[^\>]+\>/m, "")
          
          create!(
            :name         => entry.title, 
            :summary      => description,
            :url          => entry.url,
            :published_at => entry.published,
            :guid         => entry.id,
            :category   => "U.S."
          )
        end
      end
    end
  end

  def self.add_cnn_world_entries(entries)
    entries.each do |entry|

      unless exists? :guid => entry.id
        if entry.title.include? "VIDEO:"
          #do nothing
        elsif entry.title.include? "AUDIO:"
          #do nothing
        else
          #parsing the markup out of the story's summary using regex
          text = entry.summary
          description = entry.summary.to_s
          description.gsub!(/\<[^\>]+\>/m, "")
          
          create!(
            :name         => entry.title, 
            :summary      => description,
            :url          => entry.url,
            :published_at => entry.published,
            :guid         => entry.id,
            :category   => "world"
          )
        end
      end
    end
  end

  def self.add_cnn_politics_entries(entries)
    entries.each do |entry|

      unless exists? :guid => entry.id
        if entry.title.include? "VIDEO:"
          #do nothing
        elsif entry.title.include? "AUDIO:"
          #do nothing
        else
          #parsing the markup out of the story's summary using regex
          text = entry.summary
          description = entry.summary.to_s
          description.gsub!(/\<[^\>]+\>/m, "")
          
          create!(
            :name         => entry.title, 
            :summary      => description,
            :url          => entry.url,
            :published_at => entry.published,
            :guid         => entry.id,
            :category   => "politics"
          )
        end
      end
    end
  end

end

