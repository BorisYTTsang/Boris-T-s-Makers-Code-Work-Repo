###############################################################################################
=begin
  Refactor log
  1) Introduce "Services" class that allows storing data in hash as Services object (readability, modular)
  2) ABANDONED - Raise exceptions for every print command and rewrite messages accordingly?
  3) Define (2) methods to check service name and password are unique
  4) Define additional method for custom check for only alphanumeric service names (EXTRA)
  5) Extract methods from PasswordManager2 class to Services class
  6) Consolidate Services to encapsulate data management and raw data methods, while all checking and
  user interfacing is done in PasswordManager2
  7) Add "Message" and "Error" tags for all console messages (readability)"
  8) Simplify Services.sort_by (DRY)
=end
###############################################################################################

# Contains data structure and raw data operations methods
class Services

  attr_reader :list

  ## Hash instance variable (overall container)
  def initialize
    @list = {}
  end

  def add(service, password)
    @list[service.to_sym] = {"password" => password, "date" => Time.now}
  end

  def update(service, password)
    @list[service.to_sym]["password"] = password
    @list[service.to_sym]["date"] = Time.now
  end

  def remove(service)
    @list.delete(service.to_sym)
  end

  def get_password(service)
    @list[service.to_sym]["password"]
  end

  def sort_by(arg, order=nil)
    unless arg == "service" || arg == "added_on"
      return nil
    else
      @list = @list.sort_by {|serv, info| arg == "service" ? serv.to_s : info["date"]}.to_h
      @list = @list.to_a.reverse.to_h if order == "reverse"
      return @list.transform_keys(&:to_s).keys
    end
  end

  def list_services
    @list.transform_keys(&:to_s).keys
  end

end

####################################[ MAIN PROGRAM ]###########################################
######################### START HERE ################################

class PasswordManager2

  def initialize
    @services = Services.new
  end

############ [Custom requirement checker methods] ###################

  def service_unique?(service)
    unless @services.list.has_key?(service.to_sym)
      p "Error: That service already has an entry!"
      p "> You can update it with .update(service, password) or delete it with .delete(service)"
      return true
    else
      return false
    end
  end

  def password_unique?(password)
    unless @services.list.values.any?{|x| x.first.last == password}
      p "Error: That password already exists! Please enter unique password."
      return true
    else
      return false
    end
  end

  # CUSTOM! - Check inputted service name only contains alphanumeric characters (error message)
  def only_alphanumeric?(service)
    unless service =~ /\W/
      p "Error: Please only input letters and numbers for service name."
      return true
    else
      return false
    end
  end

##################### [Program methods] ############################

  ## Add unique password for a new service
  def add(service, password)
    if service_unique?(service) && password_unique?(password) && only_alphanumeric?(service)
      @services.add(service, password)
      return @services.list
    end
  end

  ## Update unique password for existing service
  def update(service, password)
    if password_unique?(password) && only_alphanumeric?(password)
      p "Message: Password for #{service} updated successfully! (new password = #{password})"
      @services.update(service, password)
      return @services.list
    end
  end

  ## Delete stored service and associated password
  def remove(service)
    # Check to see service is stored, if not return error message
    if @services.list.has_key?(service.to_sym)
      @services.remove(service)
      p "Message: Password for #{service} deleted successfully!"
      return @services.list
    else
      p "Error: That service does not exist, cannot remove!"
    end
  end

  ## Print password for specific service
  def password_for(service)
    # Check to see service is stored, if not return error message
    if @services.list.has_key?(service.to_sym)
      @services.get_password(service)
    else
      return "Error: That service has not been added yet!"
    end
  end

  ## Sort services by service name or date added/updated, in normal or reverse order
  def sort_by(arg, order=nil)
    if @services.sort_by(arg, order).nil?
      return "Error: Invalid entry!"
    else
      @services.sort_by(arg, order)
    end
  end

  ## List all stored services, print error message if no entries
  def services
    if @services.list.empty?
      p "Error: There are no entries!"
      return @services.list.to_a
    else
      return @services.list_services
    end
  end

end
