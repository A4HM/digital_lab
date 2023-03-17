# Documentation
 Sections:
- [overview](#overview)
- [part 1: images](#part-1:-images)
- [Part 2: search](#part-2:-search)
- [Part 3: 3D](#part-3:-3d)

# Overview
This application is made for the digital lab project using Ruby on Rails (RoR) as its framework. The app serves three basic functionalities: show image slides and videos, search for these images, label and view 3D models. There is also an Editor user for creating/editing/deleting content from the website using the Devise gem.


#Part 1: images
The first job of this website is to allow users to view slides made from medical students, and enable users to sign in as editors with the authority to upload new slides and delete them. 

##Database level
The tables for this part of the application are:
- Lab
- LabSection
- LabSubSection
Lab table is a parent of LabSection table, and LabSection table is a parent of LabSubSection table. The same applies in reverse as child of. Images are referenced (not stored) in the LabSubSection table, this is because ActiveStorage handles the storage of files by itself. So for an editor to upload images, he needs to choose which lab to upload to, then which section within that lab, and finally pick a sub-section to upload his images, or create one if necessary. He can also create new lab sections within a lab.
The Lab table also has a string column for youtube URLs, this is used to generate youtube iframes. URLs are tested first with a Regex expression to ensure the link is not from malicious websites, then the id of the video (the v= qeury) is taken from the link to create a proper embed youtube link (https://www.youtube.com/embed/*video id*).

#Part 2: search
The search function that is used can be found inside the Lab model file.


#Part 3: 3D
The tables related to this part of the app are:
-
