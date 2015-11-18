class ContactsController < ApplicationController

	def index
		@contacts = Contact.show_alphabetical_order
	end

	def new

	end

	def create
    	# Create new Contact from params[:contact]
    	contact = Contact.new(
      		:name => params[:contact][:name],
      		:address => params[:contact][:address],
      		:phone => params[:contact][:phone],
      		:email => params[:contact][:email])
			# Now we save the contact
    	contact.save
    	
    	redirect_to("/contacts")
  	end

  	def show 
  		@contact = Contact.find_by(id: params[:id]) || render_404(params)
  	end

  	def render_404(params)
		  Rails.logger.warn("Tried to access #{params} which did not exit.")
		  render "layouts/404"
	 end

   def save_favourite
    @contact = Contact.find_by(id: params[:id])
    @contact.favourite = true
    @contact.save
    redirect_to("/favourites")
   end

   def favourites
    binding.pry
    @contacts = Contact.where(favourite: true)
  end
end
