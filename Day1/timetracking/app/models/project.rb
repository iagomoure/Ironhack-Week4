class Project < ActiveRecord::Base

	def self.iron_find(params)
		where(id: params).first
	end

	def self.clean_old
    date = Time.now.midnight - 1.week
    where('created_at < ?, date').destroy_all
	end
end
