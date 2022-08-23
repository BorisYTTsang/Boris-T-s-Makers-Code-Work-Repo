=begin
  PLAN
    Object variable = Hash
    Data structure = { service, {password, time} }

    add()
      - add tracking of creation (Date object)
      ! check order !
        service name
        unique password
        pass validator
    remove()
    services()
    sort_by()
    password_for()
    update()
=end

###-TO DO-###
# NOT FOR TEST - when you sort twice, it sorts in reverse order (with corresponding update messages)

#### supplied updated password_validator in submitted files!
require_relative "updated_password_validator.rb"
#### supplied updated password_validator in submitted files!
require "time"

class PasswordManager2

  attr_reader :list

  ## Hash instance variable (overall container)
  def initialize
    @list = {}
  end

  ## Add unique password for a new service (no duplicates)
  def add(service, password)

    # Check for key(service name), rejects if already exists (error message)
    if @list.has_key?(service.to_sym)
      p "That service already has an entry!"
      p "> You can update it with .update(service, password) or delete it with .delete(service)"
    else
      # Check inputted service name only contains alphanumeric characters (error message)
      if service =~ /\W/
        p "Please only input letters and numbers for service name."
      else
        # Check if password is unique, rejects if not unique (error message)
        if @list.values.any?{|x| x.first.last == password}
          p "That password already exists! Please enter unique password."
        # If all okay, ADD service password entry and date& time of entry to @list hash and return hash
        else
          # Call password validator method, rejects if password fails (error message)
          if PasswordValidator.valid?(password)
            @list[service.to_sym] = {"password" => password, "date" => Time.now}
            p "Password for #{service} added successfully! (password = #{password})"
            @list
          # Error message for failing password validator
          else
            p "The password you provided is not valid!"
            p "> A password must be at least 8 characters"
            p "> And contain one of the following characters: !@$%&"
          end
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
      # Call password validator method, rejects if password fails (error message)
      if PasswordValidator.valid?(password)
        # If all good, update service with new password and track date& time (time stamp)
        @list[service.to_sym]["password"] = password
        @list[service.to_sym]["date"] = Time.now
        p "Password for #{service} updated successfully! (new password = #{password})"
        @list
      # Error message for failing password validator
      else
        p "The password you provided is not valid!"
        p "> A password must be at least 8 characters"
        p "> And contain one of the following characters: !@$%&"
      end
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

  ## Sort services by service name or date added
  def sort_by(arg)
    # Sort by service name
    if arg == "name"
      @list = Hash[@list.sort_by{|serv, info| serv.to_s}]
      p @list.transform_keys(&:to_s).keys
      @list
    # Sort by service creation date
    elsif arg == "date"
      @list = Hash[@list.sort_by{|serv, info| info["date"]}]
      p @list.transform_keys(&:to_s).keys
      @list
    else
      p "Invalid entry!"
    end
  end

  ## List (return) all stored services, return error message if no entries
  def services
    if @list.empty?
      p "There are no entries!"
    else
      @list.transform_keys(&:to_s).keys
    end
  end

end
