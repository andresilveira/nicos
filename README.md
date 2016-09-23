# NiCoS [![Code Climate](https://codeclimate.com/github/andresilveira/nicos/badges/gpa.svg)](https://codeclimate.com/github/andresilveira/nicos) [![Build Status](https://semaphoreci.com/api/v1/andresilveirah/nicos/branches/master/shields_badge.svg)](https://semaphoreci.com/andresilveirah/nicos)

### It's a nice content scrapper :heart:

Given an URL, NiCoS will visit the page referenced, parse its HTML content and store some elements such as headers (`<h1>`, `<h2>`, `<h3>`) and links (`<a>`).

### Usage

This functionality can be used in two ways. Via the web interface or via the API.

#### Browser

[ Browser usage GIF ] :camera:

#### API
The API is versioned via its route, eg. `/api/v1`, and  responds with `json` content. It isn't the best versioning mechanism but for such a simple app it should do.

[ API usage GIF ] :camera:

The routes available are:
* `GET /api/version/websites` gives you a list of all websites scrapped (including its headers and links).
* `POST /api/version/websites/` with the payload `{ url: 'http://example.com' }` will visit the page, parse it and return the data structure:

```
  {
    website: {
      id: int,
      url: string,
      title: string (the content of the title tag),
      headers: [
        {
          tag: 'h1',
          content: 'It works',
          attributes: JSON (eg. css class, id, etc)
        }
      ],
      links: [
        {
          tag: 'a',
          content: 'Follow me',
          attributes: JSON (eg. css class, id, etc)
        }
      ]
    }
  }
```
