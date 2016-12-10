# Hair Salon

#### This page provides users with an app to add, update, and delete stylists and clients in a database.

#### The following user stories should be completed:

##### As a salon owner, I want to view, add, update and delete stylists.
##### As a salon owner, I want to view, add, update and delete clients.
##### As a salon owner, I want to add clients to a stylist.

#### By Haley Swain

## Description

_{This page utilizes Ruby to create, update, and delete clients and stylists in a custom salon app.

## Setup/Installation Requirements
### SQL Commands:
#### CREATE DATABASE hair_salon;
#### \c hair_salon;
#### CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
#### CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);

## Known Bugs

There are no known bugs with this page.

## Support and contact details

In the event of any problems, please contact haley at haleyswain@gmail.com. Contributions to this code are welcomed and encouraged.

## Technologies Used
* HTML
* Ruby
* Sinatra


### License

* Copyright (c) 2016 Haley Swain
