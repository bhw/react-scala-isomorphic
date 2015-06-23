#Isomorphic Web Design with Node, Scala, and React
This repository contains the entire source for the blog article [Isomorphic Web Design with React and Scala](https://thebhwgroup.com/blog/isomorphic-web-design-react-scala).  We create a Scalatra JSON web api for a React SPA that renders server-side for improved SEO performance but switches to client-side rendering for the best user experience.

##Node Setup
First make sure you have Node v12+ then run the following in a console window in the repository root folder.
 - cd ./node
 - npm i
 - gulp; gulp webpack
 - node --harmony app.js

##Scala Setup
Make sure you have a JDK installed along with sbt, then open a console window to the repository root folder and run the following commands.
 - cd ./scala
 - sbt

Once sbt launches enter the following two commands in the sbt console:
 - container:start
 - ~ ;copy-resources;aux-compile

##DB Setup
Install postgres and then restore the database provided in the repo using this command for a console window in the repository root.  This command will create a worldcup database on your postgres server with sample data for the project.

psql -f ./db/db.sql