require 'spec_helper'


str = ENV['TARGET_HOST']
#thost = str.include?("melo")

# if thost

#  then
  
      describe file('/etc/redhat-release') do
       it { should be_file }
       it { should contain "6.2" }
      end

#      describe file('/proc/version') do
#        it { should be_file }
#        it { should contain "2.6.32-220.el6.i686" }
#      end
      
#      describe command( 'echo melody_if > /tmp/if_test.txt ;date >> /tmp/if_test.txt ') do
#        it { should return_exit_status 0 }
#      end



