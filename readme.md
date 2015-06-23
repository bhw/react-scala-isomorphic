#TODO Description

##Node Setup
First make sure you have Node v12+ then run the following in a console window in the repository root folder.
1. cd ./node
2. npm i
2. gulp; gulp webpack
3. node --harmony app.js

##Scala Setup
Make sure you have a JDK installed along with sbt, then open a console window to the repository root folder and run the following commands.
1. cd ./scala
2. sbt

Once sbt launches enter the following two commands in the sbt console:
1. container:start
2. ~ ;copy-resources;aux-compile

##DB Setup
Install postgres and then restore the database provided in the repo using this command for a console window in the repository root.  This command will create a worldcup database on your postgres server with sample data for the project.

psql -f ./db/db.sql