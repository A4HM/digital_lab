# README
to run this application:
- rails db:create
- rails db:migrate
- rails db:seed (this will create the labs and an Editor with an email and a password)

if you want to add\delete\change an editor do so in the seeds.rb file (ie. manually) becuase this app doesn't have an Admin page. You can, however, create one if needed because the app supports user authentication, authorization, password encryption and more using the Devise gem.

