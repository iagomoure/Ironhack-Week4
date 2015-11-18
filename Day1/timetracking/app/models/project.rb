class Project < ActiveRecord::Base
  
  has_many :entries

  validates :name, uniqueness: true
  validates :name, presence: true
  validates :name, length: {maximum: 30}
  validates :name, format: {with: /\A[A-Za-zÑñ0-9\s]+\z/}

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

  def total_hours_in_month(month,year)
    #Calculate which project entries
    #have date >= 1st month and date <= last day of month
    from = Date.new(year,month,1) #Time.new(year,month,1)
    to = from.end_of_month        #Time.new(year,month,-1)

    entries = self.entries.where(date: from..to)
    
    #Sum the hours of those entries
    total_minutes = entries.reduce(0) do |sum,entry| 
      sum + entry.hours * 60 + entry.minutes
    end

    total_hours = total_minutes / 60.0
  end
end
