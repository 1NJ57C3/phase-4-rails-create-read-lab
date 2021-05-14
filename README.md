# Rails Create, Index, and Show Lab

## Learning Goals

- Generate `create`, `index` and `show` routes for one resource
- Use strong params to create a new resource

## Introduction

In this lab, we'll be building an API for a plant store! In addition to our
usual Rails code, there is code for a React frontend application in the `client`
directory.

The code for the frontend application is done. Your job is to create the Rails
API so that the `fetch` requests on the frontend work successfully.

## Instructions

The React application is in the `client` directory. To set it up, from the root
directory, run:

```sh
npm install --prefix client
```

Using `--prefix client` will run the npm command within the `client` directory.

To set up your backend, run:

```sh
bundle install
```

To see how the React application and Rails API are interacting, you can run both
the Rails application and the React application together by running:

```sh
rails start
```

This will run a Rake task that will start both the Rails app and the React app.
You must use `rails start` (not `rails s`) to start both applications together!

- React: [http://localhost:4000](http://localhost:4000)
- Rails: [http://localhost:3000](http://localhost:3000)

You will also notice that the `fetch` requests in the frontend don't include
the backend domain:

```js
fetch("/plants");
// instead of fetch("http://localhost:3000/plants")
```

This is because we are [proxying][create-react-app proxying] these requests to
our API.

## Deliverables

### Model

Create a `Plant` model that matches this specification:

<table border="1" cellpadding="4" cellspacing="0">
  <tr>
    <th>Column Name</th>
    <th>Data Type</th>
  </tr>
  <tr>
    <td>name</td>
    <td>string</td>
  </tr>
  <tr>
    <td>image</td>
    <td>string</td>
  </tr>
  <tr>
    <td>price</td>
    <td>decimal</td>
  </tr>
</table>

After creating the `Plant` model, you can run `rails db:migrate db:seed` to run
your migration, and run the code in the `db/seeds.rb` file to add some sample
data to your database.

Check your progress by running `rails c` and verifying that the plants were
created successfully!

### Routes

Your API should have the following routes, which each returns the appropriate
JSON data:

#### Index Route

```txt
GET /plants


Response Body
-------
[
  {
    "id": 1,
    "name": "Aloe",
    "image": "./images/aloe.jpg",
    "price": 11.50
  },
  {
    "id": 2,
    "name": "ZZ Plant",
    "image": "./images/zz-plant.jpg",
    "price": 25.98
  }
]
```

#### Show Route

```txt
GET /plants/:id


Response Body
------
{
  "id": 1,
  "name": "Aloe",
  "image": "./images/aloe.jpg",
  "price": 11.50
}
```

#### Create Route

In your controller's `create` action, use strong params when creating the new
`Plant` object.

```txt
POST /plants


Headers
-------
Content-Type: application/json


Request Body
------
{
  "name": "Aloe",
  "image": "./images/aloe.jpg",
  "price": 11.50
}


Response Body
-------
{
  "id": 1,
  "name": "Aloe",
  "image": "./images/aloe.jpg",
  "price": 11.50
}
```

[create-react-app proxying]: https://create-react-app.dev/docs/proxying-api-requests-in-development/
