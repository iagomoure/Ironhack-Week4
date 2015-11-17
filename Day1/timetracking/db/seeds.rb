(1..25).each do |index|
	project = Project.create(name: "Project #{index}",description: "Content #{index}")
end


(1..50).each do |index|
	random = Random.new
	Entry.create(project_id: random.rand(25), hours: random.rand(1), minutes: random.rand(60), comments: "Comment #{index}", date: Time.now)
end

