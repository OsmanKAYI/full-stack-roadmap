# What is Node.js? Where is it Used?

Node.js is an open-source platform that enables JavaScript code to run outside of web pages, introducing the "JavaScript everywhere" approach in 2009 as JavaScript's popularity and usage expanded over the past decade. Node.js allows developers to write scripts that can run on the server-side using JavaScript. Over the years, Node.js has solidified its position and become the backbone of many services and website infrastructures. Several key reasons contribute to the preference for Node.js. Primarily, Node.js is known for its speed, attributed to two main factors: the V8 Engine and its non-blocking architecture.

### What is the V8 Engine?

The V8 Engine is an open-source JavaScript engine used in Chrome and Node.js. It operates on the principle of translating written JavaScript code into machine language, distinguishing it from other engines. Its speed is owed to this feature, as Node.js operates in conjunction with the V8 Engine.

### What is the Non-Blocking Model?

Node.js operates based on the non-blocking model. To understand this, let's first look at the blocking model.

1. Load the file.
2. Show the file.
3. Execute another function.

In the blocking model, the above steps are executed step by step, reading line by line from top to bottom. Conversely, in a non-blocking model, which Node.js adopts, there's no effort to follow a sequence. It begins with loading the file, allowing other unrelated code to execute while the file loads. Once the file is loaded, it is shown. In short, while the blocking model operates synchronously, the non-blocking model is asynchronous. Node.js also allows for writing synchronous code. Codes with 'async' at the beginning are synchronous.

**Blocking Model Example:**
```js
var fs = require('fs');
var data = fs.readFileSync('input.txt');

console.log(data.toString());
console.log("Program Ended");
```

**Output:**
```console
Tutorials Point is giving self learning content to teach the world in simple and easy way!!!!!
Program Ended
```

**Non-Blocking Model Example:**
```js
var fs = require('fs');

fs.readFile('input.txt', function (err, data) {
  if (err) return console.error(err);
  console.log(data.toString());
})
console.log("Program Ended");
```

**Output:**
```console
Program Ended
Tutorials Point is giving self learning content to teach the world in simple and easy way!!!!!
```
Because the non-blocking model shares a single thread, it completes the program in a shorter time and with lower expenses compared to the blocking model. Threads refer to the parts of a program that allow multiple tasks to be performed simultaneously. To illustrate, each request to a website can be seen as a task. In the blocking model, separate threads are allocated for each task. If there are, for example, ten threads and an eleventh task arrives, it can disrupt the process. Considering the pace of technology today, such a disruption could translate into a loss for a website. The non-blocking model, on the other hand, operates within a single thread loop, preventing any disruptions.

The speed and non-blocking architecture of Node.js have led many companies to choose it. Firms such as Netflix, LinkedIn, Uber, and Yahoo have shared positive outcomes in terms of performance after switching to Node.js. If you are developing a real-time application or considering building a website with data flow, Node.js can be a good choice. With JavaScript, you can develop fast applications on both the backend and frontend, leveraging a single language option.

**Ref:** [Yağmur Mutluer - Medium](https://yagmurmutluer.medium.com/node-js-nedir-nerelerde-kullan%C4%B1l%C4%B1r-8652b90d1f59)