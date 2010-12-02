#!/usr/bin/env ruby
require 'find'

def host_scan(cloneDir, rootDir, option)
  diffNum = 0
  missNum = 0
  Find.find(cloneDir) do |path|
    unless FileTest.directory?(path)
      fileRelative = path[cloneDir.size..path.size]
      fileOnRealHost = rootDir + fileRelative
      fileInHostClone = cloneDir + fileRelative
      if FileTest.exists?(fileOnRealHost )
        diffCmd = "diff #{fileOnRealHost} #{fileInHostClone}"
        diffResult = `#{diffCmd}`
        if diffResult.size > 0
          diffNum += 1
          puts "!CHANGED!: #{fileOnRealHost}"
          
          case option
          when "--test"
          when "--backup"
            cmd = "cp #{fileOnRealHost} #{fileInHostClone}"
            result = `#{cmd}`
            puts result if result.size > 0
          when "--restore"
            puts "restore to real host"
          end
          
        else
          puts "identical: #{fileOnRealHost}"
        end
      else
        missNum += 1
        puts "!MISSING!: #{fileOnRealHost}"
          
          case option
          when "--test"
          when "--backup"
            cmd = "rm #{fileInHostClone}"
            result = `#{cmd}`
            puts result if result.size > 0
          when "--restore"
            puts "restore to real host"
        end
        
      end
    end
  end
  return [diffNum, missNum]
end


if __FILE__ == $0
  badArgs = false
  
  unless [1,2].include? ARGV.size
    badArgs = true
  end
  
  unless badArgs
  	cloneDir = ARGV[0]
  	
    lastChar = cloneDir[cloneDir.size-1]
    lastCharAscii = (lastChar.class == String) ? lastChar.ord : lastChar[0]
    slashChar = "/"
    slashCharAscii = (slashChar.class == String) ? slashChar.ord : slashChar[0]
  	unless lastCharAscii == slashCharAscii
  	  puts "<cloneDir> should have a trailing /"
  	  puts "You called me with <cloneDir> = '#{cloneDir}'"
      puts "cloneDir.size = #{cloneDir.size}"
      puts "cloneDir[cloneDir.size-1] = #{cloneDir[cloneDir.size-1]}"
  	  badArgs = true
  	end
  	
  	option = "--test" # default is to test to see which files are different, but not copy anything
  	if ARGV.size == 2
  	  option = ARGV[1]
  	  unless ["--test", "--backup", "--restore"].include? option
  	    puts "Unknown option '#{option}'"
  	    badArgs = true
  	  end
  	end
  end
  
  if badArgs
    puts "host_scan: scans cloneDir folder and compares all files with the matching files from the root of the real host."
    puts "options:"
    puts "  [--test] will just check for differences"
    puts "  [--backup] will copy changed files into cloneDir, and delete files in cloneDir that do not exist on the real host"
    puts "  [--restore] should copy all changed or missing files from cloneDir to the real host (not implemented yet)"
    puts "Usage: #{$0} <cloneDir> [--test|--backup|--restore]"
    puts "You called me with these args:"
    for i in 0...(ARGV.size) do
      puts "ARGV[#{i}]: #{ARGV[i]}"
    end
    exit 1
  end
  
  puts "Scanning #{cloneDir}"
  diffNum, missNum = host_scan(cloneDir, "/", option)
  puts "Summary: changed=#{diffNum} missing=#{missNum}"
  
  puts `ps aux | grep host_scan`
end
