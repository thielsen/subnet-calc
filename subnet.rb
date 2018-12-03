def input_parse(input)
  # Parse input and check for validity
  # Outputs an array containing subnet and slash notation mask
  # Check for slash notation
  if input =~ /[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\/[0-9]{1,2}/ then
  # Check for dotted decimal mask
  elsif input =~ /[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\ [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/ then
    input = dotted_to_slash(input)
  # return nil if not a valid input
  else
    return nil
  end
  return input.split("/")
end

def dotted_to_slash(mask)

end


puts input_parse("255.255.255.255/10")
