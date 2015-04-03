module ApplicationHelper

	def flash_class_name(type)
		case type
		when 'notice'
			then "success"
		when 'error'
			then "danger"
		else
			"danger"
		end
	end
	
end
