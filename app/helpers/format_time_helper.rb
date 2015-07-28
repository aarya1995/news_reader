module FormatTimeHelper
	def format_time(date)
		Date.strptime(date, "%Y-%m-%d %H:%M:%S %Z").strftime("%m/%d/%Y")
	end
end