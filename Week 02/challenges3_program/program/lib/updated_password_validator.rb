class PasswordValidator
  def self.valid?(password)
    spec_char_arr = ["!", "@", "$", "%", "&"]
    pass_arr = password.split("")

    if (password.length > 7 && (pass_arr & spec_char_arr).any?)
      return true
    else
      return false
    end
  end
end
