#!/usr/bin/env ruby
require 'gli'

include GLI::App

#version Todo::VERSION

# subcommand_option_handling :normal
# arguments :strict

flag :f
command :new do |c|
  c.flag :priority
  c.switch :f

  c.action do |global_options,options,args|
    puts "Global:"
    puts "-f - #{global_options[:f]}"
    puts "Command:"
    puts "-f - #{options[:f] ? 'true' : 'false'}"
    puts "--priority - #{options[:priority]}"
    puts "args - #{args.join(',')}"
  end
end
command :list do |c|
  c.flag :s
  c.action do |global_options,options,args|
    puts "Global:"
    puts "-f - #{global_options[:f]}"
    puts "Command:"
    puts "-s - #{options[:s]}"
  end
end
command :done do |c|
  c.action do |global_options,options,args|
    puts "Global:"
    puts "-f - #{global_options[:f]}"
  end
end

# pre do |global,command,options,args|
#   # Pre logic here
#   # Return true to proceed; false to abort and not call the
#   # chosen command
#   # Use skips_pre before a command to skip this block
#   # on that command only
#   true
# end

# post do |global,command,options,args|
#   # Post logic here
#   # Use skips_post before a command to skip this
#   # block on that command only
# end

# on_error do |exception|
#   # Error logic here
#   # return false to skip default error handling
#   true
# end

exit run(ARGV)