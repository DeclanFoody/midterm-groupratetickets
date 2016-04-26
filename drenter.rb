def rent?(furnished, rent, baller)
  baller && (furnished || rent < 2100)
  #   return true
  # else
  #   return false
  # end
end

puts rent?(true, 2000, true)
puts rent?(true, 5000, false)
puts rent?(false, 2000, true)
puts rent?(false, 5000, false)

puts rent?(false, 2000, false)
puts rent?(true, 2000, false)
puts rent?(true, 5000, true)
puts rent?(true, 2000, false)

