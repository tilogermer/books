class AboutController < ApplicationController

	def index
		@books = Book.all
		@categories = Category.all
		@category = Category.new
		@libraries = Library.all
		
	end
end
