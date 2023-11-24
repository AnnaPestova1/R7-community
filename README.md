# README -- Code The Dream Backend Community Application

This repository contains the framework for the application called "community" in the following Treehouse
video for Active Record Associations in Rails:
https://teamtreehouse.com/library/has-and-belongs-to-many-associations .
You should create a git branch called community and make your changes there.
When you are done with the application, because you have completed all the changes from the Treehouse
videos, you can git add, commit, and push your changes and
make a pull request.

The first thing you will have to do is to complete the setup.  This is described in the Teacher's Notes
at the link above.  You do not do the rails new command,
as that has been done for you.  You start with the rails g model User command as described in the notes
and complete the directions in those notes and in the
video.  This application is also used and modified in the following video:
https://teamtreehouse.com/library/has-one-associations .


commands from notes rails new community
cd community
rails g model User name:string nickname:string
rails g model Forum name:string public:boolean
bin/rails db:migrate
bin/rake db:seed

To create the join table: bin/rails g migration CreateJoinTableUsersForums users forums


That migration name is also somewhat magical. Because it contains "JoinTable", Rails adds a call to the create_join_table method within the resulting migration code:
The calls to index on the migration table object will add indexes to the table, which will speed up database lookups. Go ahead and uncomment them.
Active Record doesn't know to use the join table to associate the two models

bin/rails db:migrate

Need to use has_and_belongs_to_many method in the model classes (User and Forum)

in user model has_and_belongs_to_many :forums
in forum model has_and_belongs_to_many :user

Now, we can add forums to a user:

in console:
user = User.find_by(name: "Jay")
 user.forums << Forum.find_by(name: "Ruby")
 user.forums << Forum.find_by(name: "SQL")
 pp user.forums
 user = User.find_by(name: "Pasan")
  user.forums << Forum.find_by(name: "iOS")
 pp user.forums

We can also look up users that belong to a forum:
in console:

 pp Forum.find_by(name: "Ruby").users
 pp ActiveRecord::Base.connection.execute "select * from forums_users"

