class Document


#Needs to be reading the first line for title and subsequent row names
	attr_reader( :title)

	def initialize( options )
		@title = options['title']
	end




end