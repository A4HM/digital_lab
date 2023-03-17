# Documentation
 Sections:
- [overview](#overview)
- [Part 1: images](#part-1-images)
- [Part 2: search](#part-2-search)
- [Part 3: 3D](#part-3-3d)

# Overview
This application is made for the digital lab project using Ruby on Rails (RoR) as its framework. The app serves three basic functionalities: show image slides and videos, search for these images, label and view 3D models. There is also an Editor user for creating/editing/deleting content from the website using the Devise gem.


# Part 1: images
The first job of this website is to allow users to view slides made from medical students, and enable users to sign in as editors with the authority to upload new slides and delete them. 

The tables for this part of the application are:
- Labs
- LabSections
- LabSubSections
Labs table is a parent of LabSections table, and LabSections table is a parent of LabSubSections table. The same applies in reverse as child of. Images are referenced (not stored) in the LabSubSections table, this is because ActiveStorage handles the storage of files by itself. So for an editor to upload images, he needs to choose which lab to upload to, then which section within that lab, and finally pick a sub-section to upload his images, or create one if necessary. He can also create new lab sections within a lab.
The Lab table also has a string column for youtube URLs, this is used to generate youtube iframes. URLs are tested first with a Regex expression to ensure the link is not from malicious websites, then the id of the video (the v= qeury) is taken from the link to create a proper embed youtube link (https://www.youtube.com/embed/*video id*).


# Part 2: search
The search function that is used can be found inside the Lab model file (app/models/lab.rb). The function simply loops through  all three lab tables recursively and executes an sql search method with the qeury, then restructure the results into an ordered hashmap. It has an O(n^3) time complexity.


# Part 3: 3D
The tables related to this part of the app are:
- Polygons
- Labels
The Polygons table references the 3D model source file (again, ActiveStorage stores the file but enables it to be referenced through any table), and has a one-to-many relation with the Labels table. So a polygon has many labels, but a label can only belong to on polygon.

The program itself, written in javascript, was initially built using only raw webgl and a linear algebra math library, but because of the unresonable complexity of writing a full 3D software from scratch, which makes maintaining and changing the code a hard task, the library THREE.js was adopted and the program had to be rewritten again. 
