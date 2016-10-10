#!/usr/bin/ruby

class MezzElements
	@@all_vars = {}
	@@elements_by = {
		'search_box' => {'xpath' => '//input[contains(@id, "lst-ib")]'},
		'search_btn' => {'name' => 'btnG'} 
	}

	def getElementBy(elem_name)
	    return  @@elements_by[elem_name]
	end

	def getVars(key)
	    return  @@all_vars[key]
	end
end
