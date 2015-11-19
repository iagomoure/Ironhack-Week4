class Person < ActiveRecord::Base
	
	has_many :participations
	has_many :projects, through: :participations

	def select_no_associated_project
		Project.all.select do |project|
			!self.projects.find_by(id: project.id)
		end
	end
end
