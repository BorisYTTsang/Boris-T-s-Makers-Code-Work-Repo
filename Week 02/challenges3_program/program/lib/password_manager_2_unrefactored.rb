class PasswordManager2

  ## Hash instance variable (overall container)
  def initialize
    @list = {}
  end

  ## Add unique password for a new service
  def add(service, password)

    # Check for service name, rejects if already exists (error message)
    if @list.has_key?(service.to_sym)
      p "That service already has an entry!"
      p "> You can update it with .update(service, password) or delete it with .delete(service)"
    else
      # EXTRA! - Check inputted service name only contains alphanumeric characters (error message)
      if service =~ /\W/
        p "Please only input letters and numbers for service name."
      else
        # Check if password is unique, rejects if not unique (error message)
        if @list.values.any?{|x| x.first.last == password}
          p "That password already exists! Please enter unique password."
        # If all okay, ADD service password entry and date& time of entry to @list hash
        else
          @list[service.to_sym] = {"password" => password, "date" => Time.now}
          p "Password for #{service} added successfully! (password = #{password})"
          @list
        end
      end
    end
  end

  ## Update unique password for existing service
  def update(service, password)
    # Rejects password if not unique (already stored)
    if @list.values.any?{|x| x.first.last == password}
      p "That password already exists! Please enter unique password."
    else
      # If all good, update service with new password and date& time stamp
      @list[service.to_sym]["password"] = password
      @list[service.to_sym]["date"] = Time.now
      p "Password for #{service} updated successfully! (new password = #{password})"
      @list
    end
  end

  ## Delete stored service and associated password
  def remove(service)
    # Check to see service is stored, if not return error message
    if @list.has_key?(service.to_sym)
      @list.delete(service.to_sym)
      p "Password for #{service} deleted successfully!"
      @list
    else
      p "That service does not exist, cannot remove!"
    end
  end

  ## Print password for specific service
  def password_for(service)
    # Check to see service is stored, if not return error message
    if @list.has_key?(service.to_sym)
      @list[service.to_sym]["password"]
    else
      p "That service has not been added yet!"
    end
  end

  ## Sort services by service name or date added/updated
  def sort_by(arg, order=nil)
    # Sort by service name, reverse order if second arg given ("reverse")
    if arg == "service"
      @list = Hash[@list.sort_by{|serv, info| serv.to_s}]
      @list = Hash[@list.to_a.reverse] if order == "reverse"
      @list.transform_keys(&:to_s).keys
    # Sort by date added/updated, reverse order if second arg given ("reverse")
    elsif arg == "added_on"
      @list = Hash[@list.sort_by{|serv, info| info["date"]}]
      @list = Hash[@list.to_a.reverse] if order == "reverse"
      @list.transform_keys(&:to_s).keys
    else
      p "Invalid entry!"
    end
  end

  ## List (return) all stored services, print error message if no entries
  def services
    if @list.empty?
      p "There are no entries!"
      []
    else
      @list.transform_keys(&:to_s).keys
    end
  end

end
