# iOS-RestKit-Node-Express
An iOS app to demonstrate how to use RestKit request/response with REST web services developed with ExpressJS

#Back-end installation

- cd iOS-RestKit-Node-Express-Server
- sudo npm install 

#How to use

- cd iOS-RestKit-Node-Express-Server
- node index.js

Server will start on the port 8000. To change this port see \app\modules\config.js

- open iOS-RestKit-Node-Express-Client.xcodeproj with Xcode and start the project

![ScreenShot](https://raw.github.com/alchimya/iOS-RestKit-Node-Express/master/screenshots/iOS-RestKit-Node-Express.gif)

# Back-end Node/Express JS
The backend consists of a Node/ExpressJS application that implements a basic authentication (see \app\modules\basic-auth-security.js).
I developed three different resources, with different routing paths (see app/api/index.js)

- <b>/user/signin</b>
it implements a POST method to emulate a login function. It will expect to receive in the body request a JSON object with this structure
```javascript
{
  "uid":"your_login_uid",
  "pwd":"your_login_pwd",
}
```
It will respond with a JSON object (see app/entities/user.js) with this structure:
```javascript
{
  "user": {
    "uid": "your_login_uid",
    "pwd": "your_login_pwd",
    "firstName": "a test first name",
    "lastName": "a test last name",
  }
}
```
- <b>/customers</b>
it implements a GET method to emulate a loading data operation. 
It will respond with an array of JSON objects (see app/entities/customer.js) with this structure:
```javascript
{
"customers": [
	{
		"firstName": "fName",
		"lastName": "lNam",
		"email": "info@domain.com",
		"id": "100001"
	},
	{
		"firstName": "fName_1",
		"lastName": "lName_1",
		"email": "info@domain1.com",
		"id": "100002"
	},
	{
		"firstName": "fName_2",
		"lastName": "lName_2",
		"email": "info@domain2.com",
		"id": "100003"
	}
]
}
```
- <b>/customers/:id</b>
it implements a GET method to emulate loading data operation with an id.  It will expect to receive a valid value in the url path (eg./customers/10001)
It will respond with a JSON object (see app/entities/customer.js) with this structure:
```javascript
{
	"customers": {
		"id": "1001",
		"firstName": "Domenico",
		"lastName": "Vacchiano",
		"email": "info@domenicovacchiano.com"
	}
}
```
- <b>/orders</b>
it has the same behaviour of /customers

- <b>/orders/:id</b>
it has the same behaviour of /customers/:id

# Front-end iOS

The fronted consists of an iOS app that consume REST resources by using RestKit (https://github.com/RestKit/RestKit).
I developed an “SDK” (see RESTSDK folder) that you can use and extend with new classes to interact with a REST backed.
To configure the REST “gateway” connection see the AppDelegate.m file.
In the ViewController.m you can see the SDK in action

# Tests

- <b>Back-end</b> (see /spec/app): I developed some useful tests by using jasmine-node (https://github.com/mhevery/jasmine-node). You can execute tests by spec.command file or by executing the command 
jasmine-node file_name-spec.js

Example:
```javascript
describe('API GET',function(){
    it("user/signin should respond with 404 status code", function(done) {
        request({
            url: TestHelper().makeBasicAuthUrl('user/signin'),
            method: 'GET'
        }, function(error, response, body){
            expect(response.statusCode).toBe(404);
            done();
        });
    });
});
```

- <b>Front-end</b>: TODO 
