class EntriesController < ApplicationController
	
	def index
		@project = Project.find_by(id: params[:project_id])
		date = Date.current

		@entries = @project.entries.where(date: date.beginning_of_month..date.end_of_month)
		@total_hours = @project.total_hours_in_month(date.month,date.year)
	end

	def new
		@project = Project.find(params[:project_id])
		#Igual que Entry.new pero de esta menera en vez de ser todos 
		#los elementos nil el project_id ya está relleno
		@entry = @project.entries.new 
	end

	def create
		#Find the project using params[:project_id]
		@project = Project.find(params[:project_id])
		
		#Create the entry project with params in params[:entry]
		@entry = @project.entries.new(entry_params)
		if @entry.save
			redirect_to action: 'index', controller: 'entries', project_id: @project.id			
		else		
			render "new"
		end	
	end

	def edit
		@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]
	end

	def update
		#Find the project
		@project = Project.find params[:project_id]

		#Find entrey to update
		@entry = @project.entries.find params[:id]

		#update the entry using update_attributes
		if @entry.update_attributes(entry_params)
			#If ok redirect_to entries index
			redirect_to action: 'index', controller: 'entries', project_id: @project.id
		#If wrong show the form again
		else
			render "edit"
		end	
	end

	def destroy
		@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]

		@entry.destroy
		redirect_to action:'index', controller: 'entries', project_id: @project.id
	end


		private 

	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date)
	end

end
