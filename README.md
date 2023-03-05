# Lunch and Learn - Mod 3 solo final project

This is a backend service that consumes external apis and exposes specific endpoints for a conceptual frontend application.

## APIs

```
GET /api/v1/recipes?country={{country}}
```
Returns a collection of recipes pertaining to supplied country name.
If a country is not supplied, a random country will be chosen.

```
GET /api/v1/learning_resources?country={{country}}
```
Returns country educational resources.

```
POST /api/v1/users
```
Endpoint for user creation. Must send user information as JSON payload in body of request.

```
POST /api/v1/favorites
```
Saves a favorite recipe for a user.

```
GET /api/v1/favorites?api_key={{user_api_key}}
```
Returns the favorite recipes saved to that user.

## Setup