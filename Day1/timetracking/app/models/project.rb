class Project < ActiveRecord::Base
  
  has_many :entries

	def self.iron_find(params)
		where(id: params).first
	end

	def self.clean_old
    date = Time.now.midnight - 1.week
    where('created_at < ?, date').destroy_all
	end

  def self.last_created_projects(max)
    order('created_at DESC').limit(max)
  end

  def self.firts_updated_projects(max)
    order('updated_at DESC').limit(max)
  end
end
