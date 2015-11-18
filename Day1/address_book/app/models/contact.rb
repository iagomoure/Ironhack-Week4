class Contact < ActiveRecord::Base

  	validates :name, presence: true
  	validates :address, presence: true
  	validates :phone, length: { maximum: 9 }
  	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

	def self.show_alphabetical_order
		order('name ASC')
	end

	
end
