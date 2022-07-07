# Manabook 

## The problem to try to solve by building this particular marketplace app. Why should this problem be solved?
1. Some people are wasting resources by throwing away their learning materials, such as textbooks that could still be used.
- This problem is not good for the environment and we need to save resources and energy. By reusing textbooks that are no longer in use, we can save the resources and energy used to produce new textbooks. When textbooks are discarded as recyclable waste, they are recycled as used paper, and so on, but this does not save the resources used to make new textbooks. 

2. The cost of learning materials is high, especially at university. 
- At the beginning of a new school year, students must purchase specific textbooks, which cost approximately $300 to $500 in total. These costs are not low, and not everyone can afford to get brand new textbooks. 
This marketplace application helps them offer cheaper prices. 

3. When you are trying to find a specific textbook on a website such as Amazon or e-bay, they have too many categories not involved in educational materials, so it takes time to find a specific book that you want.
- Usually, students must buy textbooks before their school courses begin. Therefore, they cannot waste time looking for textbooks.

This application is just for educational materials and will benefit everyone, including the environment.

## Links
- [GitHub:](https://github.com/YPYT/manabook.git)
- [Website:](https://manabook-official.herokuapp.com/)


## Application Discription

### Purpose
This application aims to save resources, protect the environment, and save money related to education by not trashing reusable items such as textbooks.

### Target audience
- All students
- Parents of students
- Adults who want to learn again

## User Stories
- As a user I want to see what are the textbooks listed.
- As a user I want to be able to sign up so I can sell or buy my textbooks.
- As a user I want to be able to log in with my new registered account.
- As a user I want to be able to edit my profile.
- As a user I want to be able to see if the products on the listing still on sale so I can buy only the products on sale.
- As a user I want to know the price of the products so I can compare which one is cheaper.
- As a user I want to know the category so I can save my time to find textbooks.
- As a user I want to know the condition of products so I can imagin how clean they are.

- As a user(buyer) I want to buy the textbooks that I want.
- As a user(buyer) I want to know if the textbook that I want is still on sale.
- As a user(buyer) I want to be able to see my bought items list.
- As a user(buyer) I want to be able to comment about the product to the seller so I can get more details of the product.
- As a user(buyer) I want to be able to get the confirmation before payment.

- As a user(seller) I want to be able to post my textbooks that I don't use anymore so I don't have to throw away them.
- As a user(seller) I want to be able to edit and delete my posts so I can manage my products.
- As a user(seller) I want to be able to reply to the comment from buyer so I can sell more easily and give them better services.
- As a user(seller) I want to be able to post the images of the textbook so I can explain how the condition of my products.
- As a user(seller) I want to be able to see my sold items list.


### Functionality / features
- Responsive design that allows for all the devices such as phone, tablet, laptop, and so on.
- Users are able to log in and sign up with their email address and password.
- The password must contain both single-byte alphanumeric characters.
- Only authenticate users are able to edit and update their profile.
- The listing products have image, title, condition, cotegory, price and link to seller profile.
- Users are able to upload up to 3 listing images.
- Users are able to comments unless the product is not sold out.
- Sellers can edit their own listing unless the item is not sold out.
- Sellers can delete their own listing.
- The listing has update time.
- Every comment has the time when they commented.
- The author of listing is able to delete comments.
- When you click the "buy this item" button, it shows order confirmation page with listing image and products infomation.
- In the success page, there is link to the product page that you bought.
- There are bought items page and sold items page in the my page link and users are able to see what they have sold and bought.
- Bought items page and sold items page has link to the item page and seller/buyer profile page.


### Tech stack (e.g. html, css, deployment platform, etc)
- HTML
- CSS
- JavaScript
- Ruby
- Ruby on Rails
- Bulma
- Heroku
- AWS S3 Bucket


### Wireframes
[Wireframe link](https://whimsical.com/wireframe-Y2jjriauAbDShVJL4N4kwX)

### Sitemap

### Screenshots

### ERD

### Trello board




## Q&A
### Explain the different high-level components (abstractions) in your app


### Detail any third party services that your app will use
- Amazon S3 Bucket
A storage service provided by Amazon Web Services (AWS) that stores objects consisting of data and its metadata in a bucket you create. In this application, it is used to store uploaded image data. The closest region (Sydney) from Melbourne was selected to reduce latency and cost.

### Describe your projects models in terms of the relationships (active record associations) they have with each other
- User model(user information)
Each User has many listings, comments, and orders(sold orders and bought orders). Also, has one profile image stored in Amazon S3 through active strage. Listings, comments and images that related with users are deleted when a user account is deleted.

- Listing model(details of each product information)
Each Listing belongs to user and category. Also, it has many comments and images which are stored in Amazon S3 through active strage, and has one order. Comments, orders and images that related with listings are deleted when a listing(product) is deleted. 

- Category model(product's category information)
Each Category has one listing. When the listings are deleted, the category related in it also will delete.

- Comment model(details of each comment for products information)
Each comment belongs to user and listing.

- Order model(stores each listing information that is ordered and users(seller and buyer) information)
Each order belongs to listing, and also buyer and seller from User model.

### Discuss the database relations to be implemented in your application
- **One to One relationship**  
This relation is when a column in one table is related to exactly one column in the other table.  
In this application, a listing has 0 or one order and order has only one listing. For example, if a listing item isn't sold, it can't have any order, but if it's sold out, it can have one order. Also, order only have one listing because it can have listing only when the listing is bought. Listing have only one category and category also have only one listing. Listing have to have one category, so when listing created, category must have one listing as well.

- **One to Many relations**  
The one-to-many relationship indicates that one column in one table (the parent table) is related to many rows in the other table (the child table).  
In this application, User has 0 or many orders, listings and comments. Users don't have to have any order, post any listing, or write any comment, but are able to have many orders, order many listings, or write many comments.  
Listing has 0 or many comments and comment has one listing. Listing can exists without any comment or have many comments, but comment can't exist unless listing create. 

### Provide your database schema design


### Describe the way tasks are allocated and tracked in your project

