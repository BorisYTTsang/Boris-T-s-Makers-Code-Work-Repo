=begin
-App Description-
Password Manager to manage passwords across multiple
service accounts such as youtube, netflix, spotify etc
Features/functions:-
  add = add service and associated password
  password_for = shows password for particular service
  service = lists services with stored passwords
=end

#### supplied updated password_validator in submitted files!
require "updated_password_validator.rb"
#### supplied updated password_validator in submitted files!

class PasswordManager

  def initialize
    @list = Hash.new
  end

  # password write method
  def add(service, password)
    if PasswordValidator.valid?(password)
      @list[service.to_sym] = password
    else
      p "The password you provided is not valid!"
      p "A password must be at least 8 characters"
      p "And contain one of the following characters: \"!@$%&\""
    end
  end

  # password read method
  def password_for(service)
    serv_key = service.to_sym
    if @list.has_key?(serv_key)
      @list[serv_key]
    else
      p "That service has not been added yet!"
    end
  end

  # list services for which password stored
  def services
    @list.transform_keys(&:to_s).keys
  end

end
