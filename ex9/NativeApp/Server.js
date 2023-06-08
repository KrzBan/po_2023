const items = {
    "Electronics": [
        {id: 0, name: "TV", price: 1000},
        {id: 1, name: "TV Remote", price: 1001},
        {id: 2, name: "Cable", price: 5},
    ],
    "Furniture":[
        {id: 3, name: "Sofa", price: 200},
        {id: 4, name: "Cupboard", price: 77},
    ],
    "Cars":[
        {id: 5, name: "Red with Flames", price: 500},
        {id: 6, name: "White with AC", price: 5000},
        {id: 7, name: "German cried when selling", price: 10000},
    ],
}

function FetchItems(category){
   return items[category] ?? [];
}

export default { FetchItems }