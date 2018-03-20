class WordsController < ApplicationController
	def index
		@words = Word.all
	end
	
	def new
		@word = Word.new
	end

	def create
		@word = Word.new(word_params).save
		redirect_to action: :index
	end

	def show 
		@word = Word.find(params[:id])
	end

	def update
		@word = Word.find(params[:id])
		@word.update!(word_params)
		redirect_to @word
	end

	def destroy
		@word = Word.find(params[:id]).destroy
		redirect_to action: :index
	end

	private

	def word_params
		params.require(:word).permit(:en, :ru)
	end

end