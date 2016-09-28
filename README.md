# NiCoS [![Code Climate](https://codeclimate.com/github/andresilveira/nicos/badges/gpa.svg)](https://codeclimate.com/github/andresilveira/nicos) [![Build Status](https://semaphoreci.com/api/v1/andresilveirah/nicos/branches/master/shields_badge.svg)](https://semaphoreci.com/andresilveirah/nicos)

### It's a nice content scraper :heart:

Given an URL, NiCoS will visit the page referenced, parse its HTML content and store some elements such as headers (`<h1>`, `<h2>`, `<h3>`) and links (`<a>`).

### Usage

This functionality can be used in two ways. Via the web interface or via the API.

#### Browser

![Browser usage](http://i.imgur.com/6xBxZYD.gif)

#### API
The API is versioned via its route, eg. `/api/v1`, and  responds with `json` content. It isn't the best versioning mechanism but for such a simple app it should do.

![API usage](http://i.imgur.com/E9vbxE4.gif)

The routes available are:
* `GET /api/version/websites` gives you a list of all websites scrapped (including its headers and links).
* `POST /api/version/websites/` with the payload `website: { url: 'http://codebikeandmore.com' }` will visit the page, parse it and return the data structure:

```
  {
    url: 'http://codebikeandmore.com',
    title: 'Code, Bike & More', // the content from the title tag
    headers: [
      {
        tag: 'h1',
        text: 'Code, Bike & More',
        attributes: JSON (eg. css class, id, etc) // Not implemented
      }
    ],
    links: [
      {
        href: 'http://codebikeandmore.com/about',
        text: 'About',
        attributes: JSON (eg. css class, id, etc) // Not implemented
      }
    ]
  }
```

##### Creating websites

```
curl -H "Content-Type: application/json" -X POST -d '{"website":{"url":"http://codebikeandmore.com"}}' http://mynicos.herokuapp.com/api/v1/websites
```

##### Listing websites

```
curl http://mynicos.herokuapp.com/api/v1/websites
```

##### Errors

In case the url submitted to the API is not valid, you should get a response like this:

```
{
  "errors": {
    "url": [
      "is not a valid url"
    ]
  }
}
```

Apart from this one, if you get an error it is most probably a bug 🐞
