class KittensController < ApplicationController

	def index
		@kittens = Kitten.all
	end

	def new 
		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.new(kitten_params)
	end 

	def show
		@kitten = Kitten.find(params[:id])
	end 

	def delete 
		@kitten.destroy
	end 

	private

	# Never trust parameters from the scary internet, only allow the white list through.
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end

end
