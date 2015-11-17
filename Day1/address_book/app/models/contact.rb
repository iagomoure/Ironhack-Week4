class Contact < ActiveRecord::Base

	def self.show_alphabetical_order
		order('name ASC')
	end
end
