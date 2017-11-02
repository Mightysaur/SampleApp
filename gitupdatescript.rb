#!/usr/bin/env ruby
require 'fileutils'

while true
  Dir.glob('**/.git').each do |path|
    next if File.file?(path) # don't process submodules
    start_time = Time.now
    project_base = File.expand_path("#{path}/..")
    puts "In #{project_base}"
    FileUtils.cd(project_base) do
      system('git stash')
      puts "Update failed" unless system('git pull --rebase')
      system('git stash pop')
    end
    end_time = Time.now
    puts "Done in #{end_time - start_time} sec"
    puts
  end
  sleep 1
end
