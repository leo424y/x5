module ApplicationHelper
	def show_message
		if flash.count > 0	
			"#{flash.first[0]}: #{flash.first[1]}"
		end
	end
end
