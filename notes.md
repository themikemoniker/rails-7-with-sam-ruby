## Introduction
> Turbolinks is a way to load more quickly just using markup. It is no longer under development and has been superseeded by the Turbo Framework, which is a part of the hotwire umbrella
[Turbolinks repo](https://github.com/turbolinks/turbolinks/blob/master/README.md)

>Rails is hackable and extensible, check out [Crafting Rails 4 Applications] for more info


## Chapter 1
Installing on linux
Vagran is a system that can manage a virtual computer, virtual box provides that virtual computer. Together they micmic a real computer so you can have a clean, predictable, and isolated env for your project

After installing both of those we can set up a vagrantfile.

```
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end
  # Set up port forwarding from guest to host
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # Mount the current directory to /from-host inside the VM
  config.vm.synced_folder ".", "/from-host"
end
```

you can then run `vagrant up`
and then `vagrant ssh`

inside vagrant box
`sudo apt-get update`

### installing system software
```
sudo apt-get install -y \
build-essential \
git \
libsqlite3-dev \
redis \
ruby-dev \
tzdata

```
### installing ruby and rails
```
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:brightbox/ruby-ng

sudo apt-get upgrade
sudo apt install rbenv
rbenv init
# for me rbenv didnt come with ruby-build
git clone https://github.com/rbenv/ruby-build.git
$(rbenv root)/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc


curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash
 rbenv install 3.1.3
 rbenv global 3.1.3
 ruby -v
 gem install rails -v 7.0.4 --no-document # version 7.2.2.1 worked for me , 7/0/4 wasnt able to create the new project

```
> this version of rails and all other gems will stay the same unless you update the Gemfile and then run `bundle install`

we will be using SQlite3 as the database
 (I may need to do something about this, i did no actions on this)

## Chapter 2

 We can run the server using:
 ``
 we can generate a controller and a view for the hello and goodbye controllers using
 ``
 we can use ERB inside of the path ()
 <%= @time %> is an example of using an instance variable to pass data from the controller to its corresponding route

 <%= link_to "Goodbye", say_goodbye_path%> is an example of using the link_to helper to help us render the template

 note:
 <% %> without the = causes the code to be run but doesnt insert the result in the page

## Chapter 3
### MVC - Model View Controller
controllers have actions
1. incoming request is sent to router, it is parsed and sent to an action
2. the action can then interact with the model and invoke other actions
3. eventually the action prepares information for the view and renders something to the user
(i think that controller methods are automatically mapped based on the http method) e.g. POST -> create method in the controller
The controler calls the model e.g. add this item to the user's cart
the controller tells it what to do, the model knows how to do it

### Rails Model Support
Operations that are easy to express in relationional terms (Sets) can be tough to code in Object Oriented systems.
Object-Relational Mapping
ORM libraries map database tables to classes
- a table is mapped to a class
- a row is mapped to an object (instance) of that class
- within that object, attributes are used to get and set individual columns

Also, it provides functions that perform table-level operations. e.g. find an order by id number.
This is implemented as a class method and returns the corresponding Order object.
```ruby
order- Order.find(1)
puts "Customer #{order.customer_id}, amount=$#{order.amount}"
```
sometimes these class-level methods return collections of objects
```ruby
Order.where(name:'dave').each do |order|
  puts order.amout
end
```
there are also methods that operate on an individual row
```ruby
Order.where(name:'dave').each do |order|
  order.pay_type= "Purchase order"
  order.save
end
```
Tables -> Classes
Rows -> Objects
Columns -> Object.attributes
Table level Operation -> Class methods
Row Level Operation -> Instance method
Usually, folks need to configure these mappings with a boatload of XML configurations

### Active Record
Active Record is the ORM layer supplied with Rails.
By relying on convention and starting with sensible defaults, Active Record minimizes that amount of configuration needed
```ruby
require 'active_record'

class Order < ApplicationRecord
end

order = Order.find(1)
order.pay_type = "Purchase order"
order.save
```
We will see in chapter 5 how Active record integrates with the rest of the application

If a web form sends the application data related to a business object, Active Record acna extract it into our model
Active Record supports data validation of model data, if the form data fails -> rails views can extract and format errors

### Action Pack: The View and Controller
Because of close interaction the support for the view and controller are bundled into a single component, Action Pack
#### View Support
View crates all or part of a response to be displayed by browser, processed by an application, or sent as an email
dynamic content is generated by templates which come in 3 flavors
ERB - although flexible, violates the spirit of MVC
By embedding code in the view, we risk adding logic that should be in the model or controller
ERB can construct HTML fragments on the server that can be used by the browser to perform partial page updates
This is grate for crating dynamic hotwired interfaces (more in Iteration F2: Creating hotwired Cart)
Rails also provides liobraries to construct XML and JSON documents using ruby code
#### And the Controller!
Controller coordinates the interaction among the user, the views, and the model
controller is also responsible for:
- routing external requests to internal actions
- caching witch gives a HUGE performance boost
- helper modules, which extend capabilities of the view template without bulking up the template's code
- managing sessions, giving users ongoing interactions with the application
## Chapter 4
### Introduction to Ruby
an object is a combination of state and methods that use that state.
you create an object using the class' constructor. The standard constructor is called `new`
you can call methods like this `cart.add_line_item(next_purchase)`
### Ruby Names
local variables, method parameters, and m,ethod names start with lowercase letter or with an underscore
instance variables start with @ sign
use underscores in multiword method or variable names

Class names, module names, and canstants start with Uppercase letter and are PascalCase
Sometimes Rails uses symbols like `:action`, `:id` think of these as string literals magically made into constants

### Methods
indentation isnt significant, but two space indentation is the de facto Ruby Standartd
no braces, just use the end keyword at the end
the returbn keyword is optional, if not present the last expression evaluated is returned

### Data Types

#### Strings
single quotes do very little
double quotes look for substitutions starting with backslash
\n replaced with newline character
#{expression} for interpolation
Strings are primitive and contain ordered collection of bytes or characters
#### Arrays and Hashes
both indexed collections of objects, accesible using a key
with arrays, key is an integer
hashes, key is an object
more efficient to access array elemebts, but hashes provide more flexibility
Any array or hash can hold objects of differeing types
accessing an index that doesnt exist returns `nil`
`nil` is an object that represents nothing
`<<` is often used with arrays to append a single value to its receiver
shortcut word syntax
```ruby
a = ['ant', 'bee', 'cat', 'dog', 'elk']
# this is the same as:
a = %w{ant bee cat dog elk}
```

Hashes use braces instead of square brackets.
Must supply 2 objects, one for key and other for value
if you have two entries for the same key, the last one wins
In rails, hashes typically use symbols as keys
Many rails hashes have been modifies so you can use a string or symbol interchangably as a key when inserting or accessing values
```ruby
inst_section = {
  cello: 'string',
  clarinet: 'woodwind',
  drum: 'percussion'
  ...
}
# or alternatively
inst_section2 = {
  :trumpet => 'brass',
  :violin => 'string'
}

inst_section[:drum]
```
hashes are accessed with same square bracket notation as arrays
you can pass hashes as a parameter to method calls
you can omit the braces if the has is the last parameter
```ruby
redirect_to action: 'show', id: product.id
```
this example shows a two-element hash being passed to the redirect_to method
#### Regular Expressions
regex lets you specify a pattern to be matched to a string.
in ruby written as  `/pattern/` or `%r{pattern}`
`/` forward slash delimits the patern
`|` pipe is an `or` operator
programs use the `=~` match operator to test if it matches the expression
```ruby
if line =~ /P(earl|ython)/
  puts "There seems to be another scripting language here"
end
```
`/ab+c` specifies repition, an `a` followed by one or more `b`s then followed by a `c`
backslash starts special sequences:
  `\d` is digit,
  `\s` is any whitespace,
  `\w` is any alphnumeric (word) character,
  `\A` is the start of a string,
  `\z` is the end of a string
  and a backslash before a wildcard character makes it matched as is e.g. `\.` matches the period



### Logic

#### Control Structures
```ruby
if count > 10
  puts "Try again"
elsif tries == 3
  puts "you lose"
else
  puts "Enter a number"
end
```

```ruby
while weight < 100 and num_pallets <= 30
  pallet = next_pallet()
  weitch += pallet.weight
  num_pallets += 1
end
```

examples of if and while statements above
unless is like `if not` in other languages
until is like `while not` in other languages

statement modifires are a useful shortcut
```ruby
puts "Danger, Will Robinson" if radiation > 3000
distance = distance * 1.2 while distance < 100
```

#### Blocks and Iterators
code blocks are chunks of code between braces or between `do...end`
people use braces for single line blocks
You can pass a block to a method by placing it after the method call
``` ruby
greet {puts "Hi"}
verbose_greet("Dave", "loyal customer") {puts "Hi"}
```
A method can invoke an associated block one or more times by using the `yield` statement
You can pass values to the block by giving parameters to `yield`
Within the block you list the names of the arguements to recieve between vertical bars `|`
Code blocks appear in Ruby often with iterators-- methods that return successive elemnts from some kind of collection

```ruby
animals = %w{ant bee cat dog elk}
animals.each {|animal| puts animal}

3.times {print "Ho!"}
```
The `&` prefix operator allows a method to capture a passed block as a named parameter

```ruby
#why does this example say print instead of puts?
def wrap &b
  print "Santa says: "
  3.times(&b)
  print"\n"
end
wrap{ print "Ho!" }
```
#### Exceptions
Exceptions are objects of the `Exception` class or its subclasses
the `raise` method causes an exception to be raised.
This interupts the normal flow through the code. Instead Ruby searches back through the call stack for how to handle the exception between the `begin...end`

```ruby
begin
  content = load_blog_data(file_name)
rescue BlogDataNotFound
  STDERR.puts "File #{file_name} not found"
rescue BlogDataFormatError
  STDERR.puts "Invalid blog data in #{file_name}"
rescue Exception => exc
  STDERR.puts "General error loading #{file_name}: #{exc.message}"
end
```

rescue clauses can be directly put on the outermost level of a method definition without needing to `begin/end` block


### Organizing Structures
#### Classes
#### Modules
#### YAML

### Marshaling Objects
### Pulling it All Together
### Ruby Idioms

