---
category: API v2
layout: post
title: API v2 Overview
---

This document describes all the resources that make up the Semaphore REST API
v2. If you have any problems or requests please contact [support](https://semaphoreci.com/support).

The root of the API is [https://api.semaphoreci.com/v2](https://api.semaphoreci.com/v2).

<ol type="i">
  <li>Constraints</li>
  <li>Authentication</li>
  <li>Errors</li>
  <li>Pagination</li>
  <li>Stability</li>
</ol>

### Constraints

Every API request and response satisfies the following constraints:

- All requests must use HTTPS.
- All data is send and received as JSON.
- Blank fields are included as `null` instead of being omitted.
- All timestamps return in ISO 8601 format.

### Authentication

All API requests require authentication. To authenticate, you need an
authentication token. You can find your authentication token by visiting your
[user settings](https://semaphoreci.com/users/edit).

Requests that require authorization will return `404 Not Found`, instead of
`403 Forbidden`. This is to prevent the accidental leakage of private projects
to unauthorized users.

There are two ways to authenticate through Semaphore API v2.

##### Authentication Token Sent as a HTTP header

``` bash
curl -H "Authorization: Token <token>" https://api.semaphoreci.com/v2
```

##### Authentication Token Sent as a query parameter

```
curl https://api.semaphoreci.com/v2/orgs?auth_token=<token>
```

### Errors

There are several errors that you can receive as a response to an API request:

##### Failing to authenticate

```
HTTP/1.1 401 Unauthorized

{"message":"Invalid authentication token."}
```

##### Attempting to authenticate by using both the header and query params

```
HTTP/1.1 401 Unauthorized

{"message":"Multiple authentication tokens provided."}
```

##### Sending invalid JSON

```
HTTP/1.1 400 Bad Request

{"message":"Problems parsing JSON"}
```

##### Requesting non existing resources

```
HTTP/1.1 404 Not Found

{"message":"Not Found"}
```

##### Requesting resources that are not visible to the user

```
HTTP/1.1 404 Not Found

{"message":"Not Found"}
```

##### Resource validation errors

```
HTTP/1.1 422 Unprocessable Entity

{
  "message": "Validation Failed",
  "errors": [
    {
      "resource": "Teams",
      "field": "permission",
      "code": "missing_field"
    }
  ]
}
```

The response contains an error object that describes the validation issue.

| Code                  |               Description                     |
|-----------------------|-----------------------------------------------|
| not_valid             | The passed field does not have a valid value. |
| missing_field         | A required filed is missing.                  |
| unpermitted_parameter | The field is not permitted.                   |

##### Requesting deletion of resources that have existing dependencies

```
HTTP/1.1 409 Conflict

{
  "message": "Cannot delete record because of dependent projects",
  "documentation_url": "https://semaphoreci.com/docs/api_v2_overview.html"
}
```

### Pagination

Every request that that returns more than 30 items will be paginated. You can
specify further pages by passing the `page` parameter.

``` bash
curl 'https://api.semaphoreci.com/v2/orgs?page=2'
```

The `Link` header includes information about pagination:

```
Link: <http://api.semaphoreci.com/v2/orgs?page=1>; rel="first",
      <http://api.semaphoreci.com/v2/orgs?page=2>; rel="last"
```

The response header also contains `Total` parameter which shows total number
of items:

```
Total: 35
```

The possible `rel` values are:

| Name  |               Description               |
|-------|-----------------------------------------|
| next  | The link for the next page of results   |
| prev  | The link previous page of results.      |
| first | The link for the first page of results. |
| last  | The link for the lastpage of results.   |

It's advised to form calls with Link header values instead of constructing your
own URLs.

### Stability

Each resource in the Semaphore API v2 is annotated with a stability
attribute, which will be set to one of three values: `prototype`, `development`,
or `production`. This attribute reflects the change management policy in place
for the resource. For a full explanation of these policies, please see our [API
compatibility policy](/docs/api_v2_compatibility_policy.html).
