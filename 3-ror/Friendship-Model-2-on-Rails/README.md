# FRIENDSHIP MODEL 2

<h3>All I want to do is this:</h1>
<ul>
  <li>Call a method on a user object</li>
  In return:
  <li>Get all the user objects which are confirmed
    <strong>In an array of objects.</strong></li>
  <li>Do this without any class or instance methods</li>
  <li>Do this only with associations</li>
  <li>Use scope if necessary</li>
</ul>

## STEP BY STEP: HOW I CREATED THIS PROJECT

### Step-1: Initialize Rails && Create Models
$ `rails new friendship-model-2` <br>
$ `rails g model User name`<br>
$ `rails g model Friendship user:references friend_id:integer confirmed:boolean`<br>

### Step-2: Alter Migration Files and Add Seed

  #### add=>
  <strong> To the migration file: </strong> </br>
  For boolean column: </br>
  ```, default: false``` </br>
  Add foreign key statement:
  ```ruby
  add_foreign_key :friendships, :users, column: :friend_id
  ```

  #### seed=>
  <strong>To the db/seed.rb file, add this lines.</strong>

```ruby
names = ["Kubilay","Tayo","Berry", "Dennis"]

names.each do |name|
  User.create(name: name)
end
```
```ruby
Friendship.create(user_id: 2, friend_id: 1)
Friendship.create(user_id: 2, friend_id: 3, confirmed: true)
Friendship.create(user_id: 2, friend_id: 4, confirmed: true)
```
```ruby
Friendship.create(user_id: 1, friend_id: 2, confirmed: true)
Friendship.create(user_id: 1, friend_id: 3)
Friendship.create(user_id: 1, friend_id: 4, confirmed: true)
```


### Step-3: Associations

models=>
```ruby
class User < ApplicationRecord
  has_many :confirmed_friendships, -> { confirmed }, class_name: 'Friendship'
  has_many :friends, source: :friend, through: :confirmed_friendships
end
```
```ruby
class Friendship < ApplicationRecord
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

  scope :confirmed, -> { where(confirmed: true) }
end
```

### Step-4: Finalize

```ruby
rails db:migrate
rails db:seed
```

### Step-5: Test
```ruby
rails c
```
#### Calling 'friends' on a user object
```ruby
tayo = User.find(2)
tayo.friends
#=> returns the confirmed friends of tayo
```

## Author

👤 [Kubilay Caglayan](https://kubilaycaglayan.com)

## Show your support

You can contribute by using pull requests or make comments with issues page!

## Acknowledgements

-https://devdocs.io/rails~5.0/activerecord/connectionadapters/schemastatements#method-i-add_foreign_key
-https://guides.rubyonrails.org/association_basics.html#belongs-to-association-reference
