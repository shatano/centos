require 'serverspec'
require 'pathname'
require 'net/ssh' 
require 'highline/import'


include Serverspec::Helper::Ssh
include Serverspec::Helper::DetectOS



RSpec.configure do |c|
  if ENV['ASK_SUDO_PASSWORD']
    require 'highline/import'
    c.sudo_password = ask("Enter sudo password: ") { |q| q.echo = false }
  else
    c.sudo_password = ENV['SUDO_PASSWORD']

  
  c.host  = ENV['TARGET_HOST']
  options = Net::SSH::Config.for(c.host, files=["pri_ssh_config"])  
  user    = options[:user] || Etc.getlogin


  if ENV['ASK_LOGIN_PASSWORD']
        options[:password] = ask("\nEnter login password: ") { |q| q.echo = false }
      else
        options[:password] = ENV['LOGIN_PASSWORD']
      end

  c.ssh   = Net::SSH.start(c.host, user, options)  
  c.os    = backend(Serverspec::Commands::Base).check_os  
end 

end
