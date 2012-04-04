# jruby-gems-jar

Sometimes a really simple solution is best. For distributing a ruby environment in a complex build pipeline,
a single jar file containing a ruby runtime and all the gems you want for your project 
can be a really simple way to go.

That is what this little project tries to do - package up ruby and all your gems into a single jar file, along with any executables from those gems.

## Getting Started

- First, download the jruby-complete.jar file from the latest jruby release at http://jruby.org/download.
- Rename the jruby-complete.jar file to jruby-gems.jar and place it in this project's directory.
- Now run "java -jar jruby-gems.jar -S rake -T" to see what options are available for adding / removing gems to the jar.


## The rakefile details

rake jruby:add_gem[gem_name]     ( add a gem to the jruby-gems.jar file )
rake jruby:extract               ( extract jruby and all the current gems into a tmp directory )
rake jruby:remove_gem[gem_name]  ( uninstall a gem from the jruby-gems.jar )
rake jruby:repackage             ( repackage jruby and gems from tmp back into jruby-gems.jar )


## Manual install of gems

rake jruby:extract

Then to install multiple gems at once run a command line this
java -jar jruby-gems.jar -S gem install -i temp gem1 gem2 gem3

Then package it back up.
rake jruby:repackage

