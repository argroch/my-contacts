class HomeController < ApplicationController
  
  def index
  	@contact_found = true
    
    # if we come back here after not finding
    # a matching contact, we're going to change
    # @contact_found to false.
    if params[:contact_found] != nil 
      @contact_found = false
      # this will trigger the notice that no contact was found.
    end
  end

  def contact_search
    # first up, the code for if a 
    # Full Name Search has been attempted
    if params[:search_type] == "FNS"
      name = params[:name]
      # time to make an Active Record call;
      # things get a little tricky, though
      # we took a full name as one string,
      # but we need the first and last names
      # separately, so its substring time
      contact = Contact.find_by(first_name: name[0...name.index(" ")].downcase.capitalize, last_name: name[name.index(" ")+1..name.length-1].downcase.capitalize)

      # what if the search came up with nothing?
      if contact == nil
        # it's back to the homepage, where we'll be
        # posting a notice that no match was found
        redirect_to root_path(contact_found: false)
      else
        # but if a contact was found, let's go to the Show page for that contact
        redirect_to contact
      end

    # next, the code for if a 
    # Last Name Search has been attempted
    elsif params[:search_type] == "LNS"
      # let's just assume that there are more
      # than one contact with the same last name,
      # so we need an Active Record call
      # that returns a collection (i.e., array)
      @contacts = Contact.where(last_name: params[:l_name].downcase.capitalize)

      # if there's only one contact in that
      # collection, then we just need that one
      # contact, so we'll make another Active Record call, 
      # this time just for a single instance
      if @contacts.count == 1
        contact = Contact.find_by(last_name: params[:l_name].downcase.capitalize)

        # and then it's off to the show page for that contact
        redirect_to contact

      # if there's no one by that last name...
      elsif @contacts.count == 0
        # it's back to the homepage,
        # and it's time for the "no contact found" notice
        redirect_to root_path(contact_found: false)
      end      
    end

  end
end
