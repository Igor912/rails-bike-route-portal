# Web-portal for urban bicycle routes and bike lanes on Ruby on Rails.
[Site Preview](http://lvivbike.herokuapp.com)

This web site is aimed to unite cyclists and create community. Everyone can find bike routes and good ideas where he can to ride a bike in the city with interest. Furthermore registered users can add his own bike routes and ideas. So this is a good resource to find useful information for you and your bike, new friends and adherents. Enjoy!


Technologies used: RoR(with slim-template views)/Sqlite3, Sass, jquery/coffeescript, ajax, amazon services(for storing uploaded files).

App main functionality: main page with all bike routes review, details view(logo/info/laid route in googlemaps; registered users can like/unlike/comment posts, and only admin-user have permissions to edit or delete posts), all registered users has permissions to suggest own bike-routes posts. After consider proposals user-admin can approve/disapprove/correct suggested posts, admin-panel mini.

###### In Terminal:
```
bundle install;
rake db:migrate;
rake routes;
```
Create user with admin permissions:
```
rails c
admin_user = User.new(:email => "user@name.com", :password => 'password', :password_confirmation => 'password', :admin => true)
admin_user.save
```
