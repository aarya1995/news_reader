class IndexController < ApplicationController
	
	helper FormatTimeHelper

	def top
		@paginate = FeedEntry.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
		@stories = @paginate.where(category: 'top').all
	end

	def world
		@paginate = FeedEntry.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
		@stories = @paginate.where(category: 'world').all
	end

	def politics
		#@stories = FeedEntry.order(created_at: :desc).where(category: 'politics').all
		
		@paginate = FeedEntry.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
		@stories = @paginate.where(category: 'politics').all
	end

	def us_and_canada
		@paginate = FeedEntry.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
		@stories = @paginate.where(category: 'US and Canada').all
	end

	def technology
		@paginate = FeedEntry.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
		@stories = @paginate.where(category: 'technology').all
	end

	def business
		@paginate = FeedEntry.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
		@stories = @paginate.where(category: 'business').all
	end

	def entertainment
		@paginate = FeedEntry.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
		@stories = @paginate.where(category: 'entertainment').all
	end

	def science
		@paginate = FeedEntry.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
		@stories = @paginate.where(category: 'science').all
	end

	def sports
		@paginate = FeedEntry.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
		@stories = @paginate.where(category: 'sports').all
	end
end
