class PeopleController < ApplicationController

	def new
		@person = Person.new
	end

	def create
		@person = Person.new(people_params)
		if @person.save
			flash[:notice] = "Person created successfully"
			redirect_to action: 'index', controller: 'people'
		else		
			flash[:alert] = "Sorry, something went wrong"
			render "new"
		end	
	end

	def index
		@person = Person.all
	end

	def show
		@person = Person.find_by(id: params[:id]) 
		@projects = @person.projects
		@projects_no_asociated = @person.select_no_associated_project 
	end

	def update
		@project = Project.find(params[:person][:projects])
		@person = Person.find(params[:id])

		@person.projects << @project
		redirect_to action: 'show', controller: 'people'
	end

	def destroy
		@person = Person.find(params[:id])
		@person.destroy
		redirect_to action:'index', controller: 'people'
	end

	private 

	def people_params
		params.require(:person).permit(:name)
	end
end


