class IndexController < ApplicationController
	
	helper FormatTimeHelper

	def top
		@paginate = FeedEntry.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
		@stories = @paginate.where(category: 'top').all
	end

	def world
		@paginate = FeedEntry.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
		@stories = @paginate.where(category: 'World').all
	end

	def politics
		#@stories = FeedEntry.order(created_at: :desc).where(category: 'politics').all
		
		@paginate = FeedEntry.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
		@stories = @paginate.where(category: 'politics').all
	end
end
