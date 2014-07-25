polyclone
=========

Simple bat file to clone a polymer seed element, supports replacing appropriate element references inside files

Using Polyclone
-------

1. Create a template folder.
2. Add any files you want in the template.  Note that any filenames (excluding extension) with the same name as the template will be renamed to the target name.  See "What it does" below for more information.
3. Add instances of ${NAME} that you want replaced when applying a new template.
4. Download polclone.bat and place it in the same folder as your template.  This is also where any new folders will be created.
5. Simply run "polyclone" from a command line.  You will be prompted for the template and target names.


What it does
-------
The batch file simply creates a new folder with the name you enter.  It then scans all the files and writes them line by line to the target folder, replacing any instance of ${NAME} with the target name.  It also checks for filenames that match the seed and renames them appropriately.  For instance, /seed/seed.html will be written to /target/target.html.  All other files will retain their name.

Here is an example of what will happen:



*template*
/template/
/template/template.html
/template/readme.txt
/template/hellowo.rld

*target*
/target/
/target/target.html
/target/readme.txt
/target/hellowo.rld
 
 

<div>This is the ${NAME} demo</div>

<div>This is the target demo</div>

Notes
-------
 - Subfolders are currently ignored.  This will be changed.
 

Planned Changes
-------

 - Eventually this will process files in a completely dynamic way (and thus not polymer specific) so that it basically copies anything in the specified template folder.
 - Support for an XML or other map file that allows you to define more variables than ${NAME} and their replacement values.
 - Port to js and node for cross-platform support and ease of use.
