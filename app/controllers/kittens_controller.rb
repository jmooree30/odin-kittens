class KittensController < ApplicationController

	def index
		@kitten = Kitten.all
		respond_to do |format|
			format.html
			format.json{ render :json => @kitten }
		end 
	end

	def new 
		@kitten = Kitten.new
    end

	def create
		@kitten = Kitten.new(kitten_params)
		if @kitten.save
			flash[:success]="Kitten created"
			redirect_to root_path
		else
			flash[:error]="Error"
			redirect_to root_path
		end 
	end 

	def show
		@kitten = Kitten.find(params[:id])
		respond_to do |format|
			format.html
			format.json{ render :json => @kitten }
		end 
	end 

	def edit
		@kitten = Kitten.find(params[:id])
	end 

	def update
		@kitten = Kitten.find(params[:id])
		if @kitten.update_attributes(kitten_params)
			flash[:success]="Kitten updated!"
		    redirect_to root_path
		end 
	end

	def destroy
		Kitten.find(params[:id]).destroy
		redirect_to root_path
	end 

	private

	# Never trust parameters from the scary internet, only allow the white list through.
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end

end
