#set :use_sudo, false

require 'bundler/capistrano'

require 'rvm/capistrano'

set :rvm_type, :user
set :rvm_ruby_string, '1.8.7@cerberus'

set :application, "cerberus_prox_frontend"

default_run_options[:pty] = true  # for git
ssh_options[:forward_agent] = true

set :repository, "git://github.com/csquared/cerberus-prox-frontend.git"
set :scm, "git"
set :user, "csquared"  # The server's user for deploys
set :branch, "master" 
set :deploy_via, :remote_cache
set :deploy_to, "/var/www/cerberus_prox_frontend"

server "atxhx-local", :app, :web, :db, :primary => true

after "deploy:update", :update_config

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

task :update_config, :roles => [:app] do
  run "cp -Rf #{shared_path}/config/* #{release_path}/config/"
end
