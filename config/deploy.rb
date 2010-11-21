set :application, "RWB"
#set :repository,  "git@github.com:eivindhagen/rwb.git"
set :repository,  "/home/git/repositories/rwb.git"

set :user, "root"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/#{user}/deploy/#{application}"
set :keep_releases, 5

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :branch, "master"

role :web, "bloib.com"                          # Your HTTP server, Apache/etc
role :app, "bloib.com"                          # This may be the same as your `Web` server
role :db,  "bloib.com", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# Add RVM's lib directory to the load path.
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

# Load RVM's capistrano plugin.    
require "rvm/capistrano"

set :rvm_ruby_string, '1.9.2'
#set :rvm_type, user  # Don't use system-wide RVM


after "deploy", "deploy:migrate", "deploy:cleanup"
