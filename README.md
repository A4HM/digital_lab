# README
to run this application:
- rails db:create
- rails db:migrate
- rails db:seed (this will create the labs and an Editor user with an email and a password)

if you want to add\delete\change an editor do so manually becuase this app doesn't have an Admin page. You can, however, create one if needed because the app supports user authentication, authorization, password encryption and more using the Devise gem.

storing of files like images, PDF, 3D model files, etc. is handled by ActiveStorage. learn more here: https://edgeguides.rubyonrails.org/active_storage_overview.html