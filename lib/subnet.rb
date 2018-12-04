def input_parse(input)
  # Parse input and check for validity
  # Outputs an array containing subnet and slash notation mask
  # Check for slash notation
  if input =~ /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\/(3[0-2]|[12][0-9]|[1-9]$)/ then
    input = input.split(/[\/\.]/)
  elsif input =~ /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\ (?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?$)/ then
    mask = dotted_to_slash(input.split(" ")[1])
    output =  (input.split(" ")[0]).split(".") << mask
  else
    return nil
  end
end

def dotted_to_slash(mask)
  mappings = {"255" => 8, "254" => 7, "252" => 6, "248" => 5, "240" => 4, "224" => 3, "192" => 2, "128" => 1, "0" => 0}
  mask = mask.split(".")
  return nil if mask[3] > mask[2] || mask[2] > mask[1] || mask[1] > mask[0]
  slash = 0
  slash = mappings[mask[3]] + mappings[mask[2]] + mappings[mask[1]] + mappings[mask[0]]
end
