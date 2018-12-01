const express = require('express');
const cors = require('cors');
const app = express();
const port = process.env.PORT || 3030;
const database = require("./database");


app.use(cors());

app.use(express.json({extended : false}));

console.log("@node-server > " + Date.now());


//GET
app.get('/api/products', (req, res) => {
    database.getProducts( (err, product) => {
      if (err) return res.status(500).send(err);
      return res.status(200).send(product);
    }, null);
});

//POST
app.post('/api/products', function(req, res) {
  console.log("T-Shirt envoyé ! ", req.body);
  database.createProducts(function(product) {
    res.send(product);
  }, req.body);
});

//DELETE
app.delete('/api/products', (req, res) => {
  console.log("T-Shirt supprimé ! ");
  database.deleteProducts(function(idProduct) {
    res.send(idProduct);
  }, req.body.idProduct);
});

//UPDATE
app.patch('/api/products', (req, res) => {
  database.updateProduct((err, dataset) => {
    console.log(`Product N°${req.body.id} updated.`);
    if (err) return res.status(500).send(err);
    else return res.status(200).send(dataset);
  }, req.body); 
});

app.listen(port, () => console.log(`Listening on port ${port}.`));