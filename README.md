# PyGym Test Assignment

We ask you to develop a system to:
• Create
• Load
• Edit
• Delete
workout plans.

* A plan has a name and consists of several (workout) days.
* A day can have multiple exercises that you should perform that day.
* A plan can be assigned to one or more user(s).
* A user is an entity with personal data (firstname, lastname, email...)
* A user can be added / edited / deleted.

* Whenever a user is assigned to a workout plan, he(she) should receive an email confirmation.**
* Whenever a plan is modified, the user(s) connected should be notified of the change by mail.**

[** = Optional]

# Create appropriate database tables and relationships.

## Technologies

- The app is a python back-end with any of the next frameworks (Flask, Django or Pyramid) in the
form of a RESTful API.

- To access the API you need to be authenticated with JSON Web tokens which can be requested
to the API itself (for example /login) with Basic Authentication (user and password)

- The token has to be sent in the Authorization header using the Token schema (Authorization: Token
<token>).

- The token has an expiration time of 5 mins, after that it can be refreshed by a specific API endpoint
but cannot be used from the other endpoints. Moreover the token can only be refreshed, in the next 5
minutes of his expiration.

![PyPi][python-image]
![PyPi][status-image]
![Dockbit][deploy-image]
![Wercker][build-image]

The app itself is very simple and objective. As normally we have a public area and a private area
so I used Django to help me to manage it. Besides on private area I'm also using DjangoAdminLTE2 to
improve the look and fell.

## Technologies utilized
* Python 3.6+
* Django 2.1.0
* PostgreSQL 10.0+

## API Main Page
![](api-main.png)

## Private area
![](admin.png)

## API Testing with Postman
![](postman.png)


## Installation

Any Operating System:

```
git clone https://github.com/diemesleno/pygym.git

cd pygym

./run.sh

access http://127.0.0.1:8000
```

## Test Information

```

```

## Endpoint (http://127.0.0.1/api/v1/users/)

### POST

#### Summary

Register a user.

#### Payload
- email: The user email.
- first_name: The user first name.
- last_name: The user last name.
- password: The user password.
- password2: The user password match.

###### Example
```
{
	"email": "angelina@gmail.com",
	"first_name": "Angelina",
	"last_name": "Jolie",
	"password": "amdk62500",
	"password2": "amdk62500"
}
```

#### Reply

- token: The user token.
- expires: The token expiration date.
- message: A message to the user.

###### Example

```
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6ImZlbGljaXR5QGdtYWlsLmNvbSIsImV4cCI6MTU2NjIyNDcxMSwiZW1haWwiOiJmZWxpY2l0eUBnbWFpbC5jb20iLCJvcmlnX2lhdCI6MTUzNDY4ODcxMX0.eSA0PJ1XSmLlWmSqdg1Gi_WWf8GoXTU4M3kijU-2qaI",
    "expires": "2019-08-19T14:21:51.346480Z",
    "message": "Thank you for be with us on VirtuaGym"
}
```

## Endpoint (http://127.0.0.1/api/v1/users/)

### GET

#### Summary

List all users.

OBS: Must include in the Headers the Authorization with value JWT token

###### Example of data received
```
[
    {
        "id": 2,
        "first_name": "Angelina",
        "last_name": "Jolie",
        "email": "angelina@gmail.com"
    },
    {
        "id": 1,
        "first_name": "Diemesleno",
        "last_name": "Carvalho",
        "email": "diemesleno@gmail.com"
    },
    {
        "id": 3,
        "first_name": "Anastasiia",
        "last_name": "Sycheva",
        "email": "anastasiia@gmail.com"
    },
    {
        "id": 4,
        "first_name": "Felicity",
        "last_name": "Jones",
        "email": "felicity@gmail.com"
    }
]
```

## Endpoint (http://127.0.0.1/api/v1/users/pk/)

### GET

#### Summary

get a user by pk.

OBS: Must include in the Headers the Authorization with value JWT token

###### Example of data received
```
{
    "id": 5,
    "first_name": "Gabriela",
    "last_name": "Duarte",
    "email": "gabriela@gmail.com"
}
```

## Endpoint (http://127.0.0.1/api/v1/users/pk/)

### PUT

#### Summary

update a user.

OBS: Must include in the Headers the Authorization with value JWT token

#### Payload
- email: The user email. 
- first_name: The user first name.
- last_name: The user last name.
- password: The user password.
- password2: The user password match.

OBS: Only the attributes informed will be updated

###### Example
```
{
	"email": "gabinha@gmail.com",
	"first_name": "Gabriela",
	"last_name": "Duarte",
	"password": "123456",
	"password2": "123456"
}
```

#### Reply

- id: The user id.
- first_name: The user first name.
- last_name: The user last name.
- email: The user email.

###### Example

```
{
    "id": 3,
    "first_name": "Gabriela",
    "last_name": "Duarte",
    "email": "gabinha@gmail.com"
}
```

# Endpoint (http://127.0.0.1/api/v1/users/pk/)

### DELETE

#### Summary

delete a user.

OBS: Must include in the Headers the Authorization with value JWT token


## Endpoint (http://127.0.0.1/api/v1/user/login/)

### POST

#### Summary

Authenticate a user.

#### Payload
- username: The user email.
- password: The user password.

###### Example
```
{
    "username": "user_email",
    "password": "user_password"
}
```

#### Reply

- token: The user token.

###### Example

```
{
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJ1c2VybmFtZSI6ImFuZ2VsaW5hQGdtYWlsLmNvbSIsImV4cCI6MTUzNDQ0ODc0OCwiZW1haWwiOiJhbmdlbGluYUBnbWFpbC5jb20ifQ.MB-Lx-i6kIbdkDP8foxVvL5_LhN5w--ZaKti-rKXFfw"
}
```

## Endpoint (http://127.0.0.1/api/v1/token/refresh/)

### POST

#### Summary

Refresh a user token.

#### Payload
- token: The user token.

###### Example
```
{
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJ1c2VybmFtZSI6ImFuZ2VsaW5hQGdtYWlsLmNvbSIsImV4cCI6MTUzNDQ0ODc0OCwiZW1haWwiOiJhbmdlbGluYUBnbWFpbC5jb20ifQ.MB-Lx-i6kIbdkDP8foxVvL5_LhN5w--ZaKti-rKXFfw"
}
```

#### Reply

- token: The new user token.

###### Example

```
{
    "token": "eyXoeXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJ1c2VybmFtZSI6ImFuZ2VsaW5hQGdtYWlsLmNvbSIsImV4cCI6MTUzNDQ0ODc0OCwiZW1haWwiOiJhbmdlbGluYUBnbWFpbC5jb20ifQ.MB-Lx-i6kIbdkDP8foxVvL5_LhN5w--ZaKti-rKXFok"
}
```

## Endpoint (http://127.0.0.1/api/v1/exercises/)

### GET

#### Summary

List all exercises.

OBS: Must include in the Headers the Authorization with value JWT token

#### Example of data received

```
[
    {
        "id": 1,
        "name": "Exercise test 1"
    },
    {
        "id": 2,
        "name": "Exercise test 2"
    }
]
```

## Endpoint (http://127.0.0.1/api/v1/exercises/pk/)

### GET

#### Summary

Show the exercise by id.

OBS: Must include in the Headers the Authorization with value JWT token

#### Example of data received

```
[
    {
        "id": 1,
        "name": "Exercise test 1"
    }
]
```

## Endpoint (http://127.0.0.1/api/v1/exercises/)

### POST

#### Summary

Create a exercise.

OBS: Must include in the Headers the Authorization with value JWT token

#### Example of data to send

```
{
    "name": "Exercise test 2"
}
```

#### Example of data received

```
{
    "id": 2,
    "name": "Exercise test 2"
}
```

## Endpoint (http://127.0.0.1/api/v1/exercises/pk/)

### PUT

#### Summary

Update a exercise.

OBS: Must include in the Headers the Authorization with value JWT token

#### Example of data to send

```
{
    "name": "Exercise test 2 Updated"
}
```

#### Example of data received

```
{
    "id": 2,
    "name": "Exercise test 2 Updated"
}
```

## Endpoint (http://127.0.0.1/api/v1/exercises/pk/)

### DELETE

#### Summary

Delete a exercise.

OBS: Must include in the Headers the Authorization with value JWT token


## Endpoint (http://127.0.0.1/api/v1/plans/)

### GET

#### Summary

List all plans.

OBS: Must include in the Headers the Authorization with value JWT token

#### Example of data received

```
[
    {
        "id": 1,
        "name": "Plan A",
        "days": [
            {
                "id": 1,
                "day_number": 22,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    },
                    {
                        "id": 5,
                        "name": "Exercise E"
                    }
                ]
            }
        ],
        "users": [
            {
                "id": 2,
                "first_name": "Angelina",
                "last_name": "Jolie",
                "email": "angelina@gmail.com"
            },
            {
                "id": 1,
                "first_name": "Diemesleno",
                "last_name": "Carvalho",
                "email": "diemesleno@gmail.com"
            }
        ]
    },
    {
        "id": 2,
        "name": "Plan B",
        "days": [],
        "users": []
    },
    {
        "id": 3,
        "name": "Plan C",
        "days": [],
        "users": []
    },
    {
        "id": 5,
        "name": "Plan E",
        "days": [
            {
                "id": 12,
                "day_number": 1,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 13,
                "day_number": 2,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 14,
                "day_number": 3,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            }
        ],
        "users": []
    },
    {
        "id": 6,
        "name": "Plan F",
        "days": [
            {
                "id": 15,
                "day_number": 1,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 16,
                "day_number": 2,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 17,
                "day_number": 3,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            }
        ],
        "users": []
    },
    {
        "id": 7,
        "name": "Plan G",
        "days": [
            {
                "id": 18,
                "day_number": 1,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 19,
                "day_number": 2,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 20,
                "day_number": 3,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            }
        ],
        "users": []
    },
    {
        "id": 8,
        "name": "Plan H",
        "days": [],
        "users": []
    },
    {
        "id": 10,
        "name": "Plan I",
        "days": [
            {
                "id": 24,
                "day_number": 1,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 25,
                "day_number": 2,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 26,
                "day_number": 3,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            }
        ],
        "users": []
    },
    {
        "id": 4,
        "name": "Plan DD",
        "days": [
            {
                "id": 9,
                "day_number": 1,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 10,
                "day_number": 2,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 11,
                "day_number": 3,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            }
        ],
        "users": [
            {
                "id": 2,
                "first_name": "Angelina",
                "last_name": "Jolie",
                "email": "angelina@gmail.com"
            },
            {
                "id": 1,
                "first_name": "Diemesleno",
                "last_name": "Carvalho",
                "email": "diemesleno@gmail.com"
            }
        ]
    },
    {
        "id": 11,
        "name": "Plan DD",
        "days": [],
        "users": []
    },
    {
        "id": 12,
        "name": "Plan J",
        "days": [
            {
                "id": 27,
                "day_number": 1,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 28,
                "day_number": 2,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 29,
                "day_number": 3,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            }
        ],
        "users": []
    },
    {
        "id": 13,
        "name": "Plan K",
        "days": [
            {
                "id": 30,
                "day_number": 1,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 31,
                "day_number": 2,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 32,
                "day_number": 3,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            }
        ],
        "users": []
    },
    {
        "id": 14,
        "name": "Plan L",
        "days": [
            {
                "id": 33,
                "day_number": 1,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 34,
                "day_number": 2,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 35,
                "day_number": 3,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            }
        ],
        "users": []
    },
    {
        "id": 15,
        "name": "Plan M",
        "days": [
            {
                "id": 36,
                "day_number": 1,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 37,
                "day_number": 2,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 38,
                "day_number": 3,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            }
        ],
        "users": [
            {
                "id": 1,
                "first_name": "Diemesleno",
                "last_name": "Carvalho",
                "email": "diemesleno@gmail.com"
            }
        ]
    },
    {
        "id": 16,
        "name": "Plan N",
        "days": [
            {
                "id": 39,
                "day_number": 1,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 40,
                "day_number": 2,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 41,
                "day_number": 3,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            }
        ],
        "users": [
            {
                "id": 2,
                "first_name": "Angelina",
                "last_name": "Jolie",
                "email": "angelina@gmail.com"
            },
            {
                "id": 1,
                "first_name": "Diemesleno",
                "last_name": "Carvalho",
                "email": "diemesleno@gmail.com"
            }
        ]
    },
    {
        "id": 17,
        "name": "Plan O",
        "days": [
            {
                "id": 42,
                "day_number": 1,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 43,
                "day_number": 2,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            },
            {
                "id": 44,
                "day_number": 3,
                "exercises": [
                    {
                        "id": 1,
                        "name": "Exercise A"
                    },
                    {
                        "id": 2,
                        "name": "Exercise B"
                    },
                    {
                        "id": 3,
                        "name": "Exercise C"
                    }
                ]
            }
        ],
        "users": [
            {
                "id": 2,
                "first_name": "Angelina",
                "last_name": "Jolie",
                "email": "angelina@gmail.com"
            },
            {
                "id": 1,
                "first_name": "Diemesleno",
                "last_name": "Carvalho",
                "email": "diemesleno@gmail.com"
            }
        ]
    }
]
```

## Endpoint (http://127.0.0.1/api/v1/plans/pk/)

### GET

#### Summary

Show the plan by id.

OBS: Must include in the Headers the Authorization with value JWT token

#### Example of data received

```
{
    "id": 1,
    "name": "Plan A",
    "days": [
        {
            "id": 1,
            "day_number": 22,
            "exercises": [
                {
                    "id": 1,
                    "name": "Exercise A"
                },
                {
                    "id": 3,
                    "name": "Exercise C"
                },
                {
                    "id": 5,
                    "name": "Exercise E"
                }
            ]
        }
    ],
    "users": [
        {
            "id": 2,
            "first_name": "Angelina",
            "last_name": "Jolie",
            "email": "angelina@gmail.com"
        },
        {
            "id": 1,
            "first_name": "Diemesleno",
            "last_name": "Carvalho",
            "email": "diemesleno@gmail.com"
        }
    ]
}
```

## Endpoint (http://127.0.0.1/api/v1/plans/)

### POST

#### Summary

Create a plan.

OBS: Must include in the Headers the Authorization with value JWT token

#### Example of data to send

```
{
    "name": "Plan W",
    "days": [
        {
            "day_number": 11,
            "exercises": [1, 2, 3]
                
        },
        {
            "day_number": 21,
            "exercises": [4, 5, 6]
        },
        {
            "day_number": 31,
            "exercises": [7, 8, 1]
        }

    ],
    "users": [1, 2]
}
```

#### Example of data received

```
{
    "id": 22,
    "name": "Plan W",
    "days": [
        {
            "id": 62,
            "day_number": 11,
            "exercises": [
                {
                    "id": 1,
                    "name": "Exercise A"
                },
                {
                    "id": 2,
                    "name": "Exercise B"
                },
                {
                    "id": 3,
                    "name": "Exercise C"
                }
            ]
        },
        {
            "id": 63,
            "day_number": 21,
            "exercises": [
                {
                    "id": 4,
                    "name": "Exercise D"
                },
                {
                    "id": 5,
                    "name": "Exercise E"
                },
                {
                    "id": 6,
                    "name": "Exercise F"
                }
            ]
        },
        {
            "id": 64,
            "day_number": 31,
            "exercises": [
                {
                    "id": 8,
                    "name": "Exercise O"
                },
                {
                    "id": 1,
                    "name": "Exercise A"
                },
                {
                    "id": 7,
                    "name": "Exercise G"
                }
            ]
        }
    ],
    "users": [
        {
            "id": 2,
            "first_name": "Angelina",
            "last_name": "Jolie",
            "email": "angelina@gmail.com"
        },
        {
            "id": 1,
            "first_name": "Diemesleno",
            "last_name": "Carvalho",
            "email": "diemesleno@gmail.com"
        }
    ]
}
```

## Endpoint (http://127.0.0.1/api/v1/plans/pk/)

### PUT

#### Summary

Update a plan.

#### Payload
- name: The Plan name. (Optional)
- days: The workout days for the plan, including the exercises for each day.
- users: The users subscribed to the plan. (Optional)


OBS: Must include in the Headers the Authorization with value JWT token

#### Example of data to send

```
{
    "name": "Plan Q",
    "days": [
        {
            "day_number": 11,
            "exercises": [1, 2, 3]
                
        },
        {
            "day_number": 21,
            "exercises": [4, 5, 6]
        },
        {
            "day_number": 31,
            "exercises": [7, 8, 1]
        }

    ],
    "users": [1, 2, 4]
}
```

#### Example of data received

```
{
    "id": 5,
    "name": "Plan Q",
    "days": [
        {
            "id": 12,
            "day_number": 1,
            "exercises": [
                {
                    "id": 1,
                    "name": "Exercise A"
                },
                {
                    "id": 2,
                    "name": "Exercise B"
                },
                {
                    "id": 3,
                    "name": "Exercise C"
                }
            ]
        },
        {
            "id": 13,
            "day_number": 2,
            "exercises": [
                {
                    "id": 1,
                    "name": "Exercise A"
                },
                {
                    "id": 2,
                    "name": "Exercise B"
                },
                {
                    "id": 3,
                    "name": "Exercise C"
                }
            ]
        },
        {
            "id": 14,
            "day_number": 3,
            "exercises": [
                {
                    "id": 1,
                    "name": "Exercise A"
                },
                {
                    "id": 2,
                    "name": "Exercise B"
                },
                {
                    "id": 3,
                    "name": "Exercise C"
                }
            ]
        },
        {
            "id": 89,
            "day_number": 11,
            "exercises": [
                {
                    "id": 1,
                    "name": "Exercise A"
                },
                {
                    "id": 2,
                    "name": "Exercise B"
                },
                {
                    "id": 3,
                    "name": "Exercise C"
                }
            ]
        },
        {
            "id": 90,
            "day_number": 21,
            "exercises": [
                {
                    "id": 4,
                    "name": "Exercise D"
                },
                {
                    "id": 5,
                    "name": "Exercise E"
                },
                {
                    "id": 6,
                    "name": "Exercise F"
                }
            ]
        },
        {
            "id": 91,
            "day_number": 31,
            "exercises": [
                {
                    "id": 8,
                    "name": "Exercise O"
                },
                {
                    "id": 1,
                    "name": "Exercise A"
                },
                {
                    "id": 7,
                    "name": "Exercise G"
                }
            ]
        }
    ],
    "users": [
        {
            "id": 2,
            "first_name": "Angelina",
            "last_name": "Jolie",
            "email": "angelina@gmail.com"
        },
        {
            "id": 1,
            "first_name": "Diemesleno",
            "last_name": "Carvalho",
            "email": "diemesleno@gmail.com"
        },
        {
            "id": 4,
            "first_name": "Felicity",
            "last_name": "Jones",
            "email": "felicity@gmail.com"
        }
    ]
}
```

## Endpoint (http://127.0.0.1/api/v1/plans/pk/)

### DELETE

#### Summary

Delete a day.

OBS: Must include in the Headers the Authorization with value JWT token


## Endpoint (http://127.0.0.1:8000/api/v1/plans/6/add_user/)

### POST

### Summary

Add users in a plan

#### Payload

- users: The users subscribed to the plan. (one or a list of)

OBS: Must include in the Headers the Authorization with value JWT token

#### Example of data to send

```
{
   "users": [1, 2]
}
```

#### Example of data treceived

```
{
    "message": "Users added on this plan"
}
```

## Administration Area

```
# Create a super user

docker-compose exec web python manage.py createsuperuser

# Access http://127.0.0.1:8000/admin/
```

## Release History

* 1.0.0
    * First release
* 0.1.6
    * Fixing issues
* 0.1.5
    * Testing deployment
* 0.1.4
    * Creation of Dockerfiles
* 0.1.3
    * Preparing files to production
* 0.1.2
    * Create the Plan API
* 0.1.1
    * Create the Plan Model
* 0.1.0
    * ADD: Crete the app `plan`
* 0.0.9
    * Create the User API
* 0.0.8
    * ADD: Create the app `user` 
* 0.0.7
    * Create the Day API
* 0.0.6
    * Create the Day Model
* 0.0.5
    * ADD: Create the app `day`
* 0.0.4
    * Create the Exercise API
* 0.0.3
    * Create the Exercise Model
* 0.0.2
    * Create the app `exercise` 
* 0.0.1
    * Create the pygym project

## Meta

Diemesleno Souza Carvalho – [@diemesleno](https://twitter.com/diemesleno) – diemesleno@gmail.com

Distributed under the ![AUR][gpl-image] license. 

[https://github.com/diemesleno/pygym](https://github.com/diemesleno/)

[python-image]: https://img.shields.io/pypi/pyversions/Django.svg?style=flat-square
[gpl-image]: https://img.shields.io/aur/license/yaourt.svg?style=flat-square
[status-image]: https://img.shields.io/pypi/status/Django.svg?style=flat-square
[build-image]: https://img.shields.io/wercker/ci/wercker/docs.svg
[deploy-image]: https://img.shields.io/dockbit/DockbitStatus/health.svg?token=TvavttxFHJ4qhnKstDxrvBXM&style=flat-square
