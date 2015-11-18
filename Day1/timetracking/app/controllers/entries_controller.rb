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
		@project = Project.find(params[:project_id])
		@entry = @project.entries.new(entry_params)
		if @entry.save
			redirect_to action: 'index', controller: 'entries', project_id: @project.id			
		else		
			render "new"
		end	
	end

	private 

	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date)
	end

end
