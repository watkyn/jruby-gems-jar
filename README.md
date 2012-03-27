# jruby-gems-jar

The goal of this project is to demonstrate how one can create and deploy a single jar file
that will contain a ruby runtime and all the gems you may want for your project.

Then distributing the jar to any system running the a supported version of java, should be able to run your code.

## Creating the jar file

- To get started, download the jruby-complete.jar file from the latest jruby release at http://jruby.org/download.
- Rename the jar file to jruby-gems.jar and put it in the project directory.
- Now run "java -jar jruby-gems.jar -S rake -T" to see what options are available for adding / removing gems to the jar.

## Running ruby from the jar file

- 



