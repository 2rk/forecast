set :rails_env, 'integ'

set :rvm_ruby_string, "2.1.1"

$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

set :rvm_install_ruby_params, '--verify-downloads 1'
set :rvm_type, :user
set :branch, 'develop'


#default_run_option[:pty] = true
ssh_options[:forward_agent] = true


# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`


before 'deploy:setup', 'rvm:install_rvm' # update RVM
before 'deploy:setup', 'rvm:install_ruby'