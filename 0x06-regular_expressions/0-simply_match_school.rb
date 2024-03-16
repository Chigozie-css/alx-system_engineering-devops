#!/usr/bin/env ruby

def match_school(input)
  input.scan(/School/).join
end

puts match_school(ARGV[0])
