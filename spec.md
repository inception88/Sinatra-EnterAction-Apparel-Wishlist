# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Sinatra was used to build all the controllers for the application. All controllers inherit Sinatra::Base.
- [x] Use ActiveRecord for storing information in a database - ActiveRecord was used for database migrations and connecting all of the models to the database. All models inherit ActiveRecord::Base.
- [x] Include more than one model class (e.g. User, Post, Category) - There were 4 classes used: User, Wishlist, Product, Product_Wishlist
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - A User has many wishlists.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - A Wishlist belongs to a User.
- [x] Include user accounts with unique login attribute (username or email) - You must login with an email.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - A User has all the CRUD capability for their wishlists.
- [x] Ensure that users can't modify content created by other users - A user can only see their own wishlists.
- [x] Include user input validations - Validates presence of email, name and password when logging in.
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
