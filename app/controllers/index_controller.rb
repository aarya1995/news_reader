class IndexController < ApplicationController
	
	def index
		@stories = FeedEntry.all
	end
end
