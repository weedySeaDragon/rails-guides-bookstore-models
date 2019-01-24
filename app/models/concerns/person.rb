module Person


  def display_name
    "#{string_and_space(title)}#{string_and_space(first_name)}#{last_name}"
  end


  # -----------------------------------------------------------------------
  # -----------------------------------------------------------------------


  private


  # if the string is blank, return an empty string.
  # else return the string followed by a blank space.
  #
  # Helpful for constructing a display string
  def string_and_space(str)
    str.blank? ? '' : (str + ' ')
  end

end
