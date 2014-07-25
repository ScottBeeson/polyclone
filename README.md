polyclone
=========

Simple bat file to clone a polymer seed element, supports replacing appropriate element references inside files

Using Polyclone
-------

1. Download the core-seed element from [here](http://www.polymer-project.org/docs/start/reusableelements.html).  If you would like, you can also create your own.
2. Find all references to the element name and replace them with ${NAME} (This can be customized easily in the bat file)
3. Make sure the seed element folder name matches the html file name.  If you downloaded the official polymer seed, you will need to rename the folder to remove the "-master".
4. Download the bat file in the repository to the same place you put the seed element folder.  This will also be where you want to store the new elements you create.
5. Simply run "polyclone &lt;seed folder&gt; &lt;new element name&gt;" from a command line.


What it does
-------
The batch file simply creates a new folder with the name you enter.  It then scans all the files and writes them line by line to the target folder, replacing any instance of ${NAME} with the target name.  It also checks for filenames that match the seed and renames them appropriately.  For instance, /seed/seed.html will be written to /target/target.html.  All other files will retain their name.


Notes
-------
 - If you don't use the standard seed element, it is very easy to modify which files are processed.
 - 
 

Planned Changes
-------

 - Eventually this will process files in a completely dynamic way (and thus not polymer specific) so that it basically copies anything in the specified template folder.
 - Support for an XML or other map file that allows you to define more variables than ${NAME} and their replacement values.
 - Port to js and node for cross-platform support and ease of use.
