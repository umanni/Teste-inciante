#  A blog with auth in Ruby on Rails Framework

This is a test to simulate a "real sprint" that I'll be assigned while working as an intern at Umanni.

You'll need to follow some instructions to get this app running:

## 1: Requirements

You must have [Docker](https://docs.docker.com/) and
[Docker Compose](https://docs.docker.com/compose/) on your machine.


## 2: 'Clone & Run' the project

You should clone the project (branch bruno) into a conveniently-named directory. The following code will clone this repo into 
a directory called blog-bruno and run the app:

```
git clone -b bruno https://github.com/umanni/estagio.git blog-bruno \
	&& cd blog-bruno \
	&& docker-compose up -d \
	&& docker-compose run --rm web rake db:migrate \
	&& docker-compose run --rm web rspec
```

That's it! Check the running app web interface: [http://localhost:3000](http://localhost:3000)


## 3: Bring online the project's containers

Alternatively, you can also choose to follow the steps bellow.

- download the repo (branch bruno)

    `bundle install`
    
    `rails db:migrate`
   
    `rspec`

    `rails server`

- visit http://localhost:3000/contact-me