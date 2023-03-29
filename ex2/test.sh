#List All
curl -L localhost:8000/product
#Add New
curl -L -H 'Content-Type: application/json' -X POST localhost:8000/product/new -d '{"name": "Name", "price": 200}'
#Get One
curl -L localhost:8000/product/1
#Edit
curl -L -H 'Content-Type: application/json' -X POST localhost:8000/product/1/edit -d '{"name": "NameChanged", "price": 300}'
#Delete
curl -L -X POST localhost:8000/product/1

#List All
curl -L localhost:8000/book
#Add New
curl -L -H 'Content-Type: application/json' -X POST localhost:8000/book/new -d '{"name": "Name", "price": 200}'
#Get One
curl -L localhost:8000/book/1
#Edit
curl -L -H 'Content-Type: application/json' -X POST localhost:8000/book/1/edit -d '{"name": "NameChanged", "price": 300}'
#Delete
curl -L -X POST localhost:8000/book/1

#List All
curl -L localhost:8000/user
#Add New
curl -L -H 'Content-Type: application/json' -X POST localhost:8000/user/new -d '{"firstName": "John", "lastName": "Doe"}'
#Get One
curl -L localhost:8000/user/1
#Edit
curl -L -H 'Content-Type: application/json' -X POST localhost:8000/user/1/edit -d '{"firstName": "Johners", "lastName": "Doers"}'
#Delete
curl -L -X POST localhost:8000/user/1
