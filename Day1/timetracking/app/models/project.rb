class Project < ActiveRecord::Base

	def self.iron_find(params)
		where(id: params).first
	end
end
