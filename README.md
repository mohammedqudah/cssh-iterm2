# cssh-iterm2

Sometimes I need to connect  to multiple servers at once in order to troubleshoot something or configure something on identical remote connections, I used to use csshX but it was bad experience due to these reasons:
- It uses max Terminal while Im Iterm2 user.
- It opens new window for each connection while I prefer tabs especially if I have too many ssh connections.
- And finally and the most important if I needed to use ssh proxy for ssh jump box or something similar to connect to remote machine it was a real nightmare for me to use csshX.

Anyway I found the Apple has their own scripting language to deal with applications and things like so, hence I decided to write an applescript to open new iterm2 window with a tab for each connection and run the ssh command in each tab, also I used bash to integrate it with my current shell.

So to use it save the scipt in any directory you want, I saved it under ~/localscripts/cssh.sh, then add a new alias to the cssh command under the ~/.bash_profile :
'''
mkdir  ~/localscripts
cd ~/localscripts
git clone https://github.com/mohammedqudah/cssh-iterm2.git
'''

Then add the alias to .bash_profile

'''
echo 'alias cssh="bash ~/localscripts/cssh-iterm2/cssh.sh"' >> ~/.bash_profile
'''

The script first paramter is the ssh command, Why I did so? Because if I want to use none default ssh command. Then it accesspt the hosts to connect

Now for connecting to multiple hosts we will run the below command **After making sure that we loaded the new profile**:

'''
cssh ssh host1 host2 host3
'''

To use it with different ssh commands check the below example:
'''
alias sshproduction='ssh -o ProxyCommand="ssh -W %h:%p JumpBoxIP"'

cssh sshproduction host1 host2 host3
'''

One last thing to mention here not to forget to rund the "Coomad+Shfit+I" keys to control the different tabs
