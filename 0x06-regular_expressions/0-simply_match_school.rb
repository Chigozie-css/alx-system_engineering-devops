#!/usr/bin/env ruby

def match_school(input)
  input.match(/School/) ? "School" : ""
end

puts match_school(ARGV[0])
