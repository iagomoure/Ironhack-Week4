(1..25).each do |index|
	Project.create(name: "Project #{index}",description: "Content #{index}")
end