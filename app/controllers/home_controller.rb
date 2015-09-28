class HomeController < ApplicationController
  def index
  	@contact_found = false

  	if params[:name] != nil
  		name = params[:name]
  		contact = Contact.find_by(first_name: name[0...name.index(" ")].downcase.capitalize, last_name: name[name.index(" ")+1..name.length-1].downcase.capitalize)

  		redirect_to contact
  	end
  end
end
