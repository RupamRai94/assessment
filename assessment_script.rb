require 'date'


# Received the argument which passed from console
git_dir = ARGV[0]


# Used for executing project path
Dir.chdir git_dir


# Get current branch name
current_branch_name = `git branch`
puts "active branch: #{current_branch_name}"

# To check local changes exist or not
local_changes_status = `git diff`
if(local_changes_status != "")
	puts "local changes: true"
else
	puts "local changes: false"
end


# Check whether code committed within week or not
last_committed_date = `git log -1 --format=%cd`
updated_status = Date.parse(last_committed_date) >= Date.today - 7
puts "recent commit: #{updated_status}"


# Get the current author name and compare
author_name = `git log -1 --pretty=format:%an`
if(author_name == "Rufus")
	puts "blame Rufus: true"
else
	puts "blame Rufus: false"
end