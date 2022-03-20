# NodeJS Employe Manage/ JWT Authentication 

This is a NodeJS API that supports username and password authentication with JWTs and has APIs that return Employee details

## Available APIs

### Admin APIs

#### POST `/admin`

POST to `/admin` to create a new admin.

The body must have:

* `username`: The username
* `password`: The password
* `extra`: Some extra information you want to save from the user (It's a string)

It returns the following:

```json
{
  "id_token": {jwt},
  "access_token": {jwt}
}
```


#### POST `/admin/login`

You can do a POST to `/sessions/create` to log a user in.

The body must have:

* `username`: The username
* `password`: The password

It returns the following:

```json
{
  "id_token": {jwt},
  "access_token": {jwt}
}
```

The `id_token` and `access_token` are signed with the secret located at the `config.json` file. The `id_token` will contain the `username` and the `extra` information sent, while the `access_token` will contain the `audience`, `jti`, `issuer` and `scope`.



### Employee API


#### GET `/api/status`

It returns a status of API and no authentication required.


#### GET `/api/employeRand`

It returns a Random employee and no authentication required.


#### GET `/api/protected/employe?limit=2`

It returns a employees and authentication required.



#### GET `/api/protected/employe/:useri_d`

It returns employee by ID and authentication required.



#### POST `/api/protected/employe`

Add Employee details

The body must have:

* `id`: int, required
* `name`: string, optional
* `salary`: int , required
* `age`: int , required
* `profile_image`: string, optional


#### PUT `/api/protected/employe`

Update Employee details

The body must have:

* `id`: int, required
* `name`: string, optional
* `salary`: int , required
* `age`: int , required
* `profile_image`: string, optional


#### DELETE `/api/protected/employe/:id`

Delete Employee details




## Running it

Just clone the repository, run `npm install` and then `npm run start`. That's it :).

If you want to run it on another port, just run `PORT=3001 node server.js` to run it on port 3001 for example
