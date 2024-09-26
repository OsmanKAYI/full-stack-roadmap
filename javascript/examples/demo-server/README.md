# Create Demo API with JSON Server

## Installation

```bash
npm install -g json-server
```

## Usage

### First Way

- Create a `db.json` file

```json
{
  "posts": [
    { "id": "1", "title": "a title", "views": 100 },
    { "id": "2", "title": "another title", "views": 200 }
  ],
  "comments": [
    { "id": "1", "text": "a comment about post 1", "postId": "1" },
    { "id": "2", "text": "another comment about post 1", "postId": "1" }
  ],
  "profile": {
    "name": "typicode"
  }
}
```

- Start the server

```bash
json-server db.json
```

- Visit http://localhost:3000 to see the demo or use the `curl` command.

```bash
curl http://localhost:3000/profile/
#{
#  "name": "typicode"
#}
curl http://localhost:3000/posts/
#[
#  {
#    "id": "1",
#    "title": "a title",
#    "views": 100
#  },
#  {
#    "id": "2",
#    "title": "another title",
#    "views": 200
#  }
#]
curl http://localhost:3000/comments/
#[
#  {
#    "id": "1",
#    "text": "a comment about post 1",
#    "postId": "1"
#  },
#  {
#    "id": "2",
#    "text": "another comment about post 1",
#    "postId": "1"
#  }
#]
```

### Second Way

- Create a `generate.js` file

```js
module.exports = function (){
  var faker = require('faker');
  var _ = require('lodash');
  return {
    people: _.times(100, function(n){
      return {
        id: n,
        name: faker.name.findName(),
        email: faker.internet.email(),
        avatar: faker.image.avatar()
      }
    })
  }
}
```

- Install `faker` and `lodash`
```bash
npm install faker lodash
```

- Start the server

```bash
json-server generate.js
```

- Visit http://localhost:3000 to see the demo or use the `curl` command.

**Ref:**

- [json-server (GitHub)](https://github.com/typicode/json-server)
- [json-server (npm)](https://www.npmjs.com/package/json-server)
- [Creating Demo API With JSON Server - egghead.io](https://egghead.io/lessons/javascript-creating-demo-apis-with-json-server)