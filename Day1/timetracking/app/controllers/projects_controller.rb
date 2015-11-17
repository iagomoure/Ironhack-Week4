class ProjectsController < ApplicationController
	def index
		#@projects = Project.firts_updated_projects(10)
		@projects = Project.last_created_projects(10)
		
		if @projects.empty?
			render 'no_projects_found'
		end
	end

	def show
		@project = Project.find_by(id: params[:id]) || render_404(params)
	end

	def render_404(params)
		Rails.logger.warn("Tried to access #{params} which did not exit.")
		render "layouts/404"
	end
end
