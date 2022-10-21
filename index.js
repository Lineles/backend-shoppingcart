const cors = require('cors');
const { v4: uuidv4 } = require('uuid');

const express = require('express');
const app = express();
const port = 9000;


const products = [
    {title: 'Tv', price: 20, Currency: 'Euro', id: 1},
    {title: 'sofa', price: 400, Currency: 'Euro', id: 1},
    {title: 'house', price: 250000, Currency: 'Euro', id: 1},   
];


app.use(express.json())

app.use(cors("*"));
app.use(function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  next();
});


// Get /Products
app.get('/products', (request, response) => {

    response.status(200).send(products)
});

// Post /Products
app.post('/products', (request, response) => {

    const newproducts = request.body;
    const newproductsWithID = {...newproducts, id: uuidv4() }

    products.push(newproductsWithID)

    response.status(200).send(newproductsWithID)
});

// Get by ID /Products/:id
app.get('/products/:id', (request, response) => {
    const params = request.params;
    const requestetproducts = products.find(products => products.id === Number(params.id)) 
        if(!requestetCountry){
            response.status(404).send({message: `Country with the id ${params.id} does not exist`})
        }else{
            response.status(200).send(requestetproducts)
        }
});



app.listen(port, (error) => {
    if(error){
        console.log(error)
    } else {
        console.log(`app is running on port ${port}`)
    }
})


