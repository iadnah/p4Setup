p4Setup
=======

bash script for dynamically setting environment variables used by perforce clients


usage
=======
  1. Place p4Setup.sh in your home directory. chmod 0700 it.
  2. Edit your ~/.bashrc and add a line to include p4Setup.sh
  3. cp p4env to ~/.p4env
  4. chmod 0700 ~/.p4env
  5. source ~/.bashrc
  
This will export a function called p4Setup into your bash environment and run it each time
you start a new bash session. p4Setup, when called without arguments, imports the contents
of ~/.p4env into your bash session.

p4Setup takes 1 optional argument (termed an "index"). If an index is specified p4Setup will
check for a file with the same name as the index inside of ~/.p4env.d/. If such a file exists
it's contents will be imported into your shell environment after ~/.p4env has been loaded.

Ex:
Running _p4Setup iadnah@test_ will:
  1. Import the contents of ~/.p4env
  2. Import the contents of ~/.p4env.d/iadnah@test (if it exists)
