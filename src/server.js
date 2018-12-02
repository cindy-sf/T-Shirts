const express = require('express');
const cors = require('cors');
const app = express();
const port = process.env.PORT || 3030;
const multer = require('multer');
const database = require("./database");

app.use(cors());

app.use(express.json({extended : false}));

console.log("@node-server > " + Date.now());

const storage = multer.diskStorage({
  destination: function(req, file, cb) {
      cb(null, "src/assets/t-shirts") 
  },
  filename: function(req, file, cb) {
      cb(null, file.originalname)
  }
});

const upload = multer({ storage })

//GET
app.get('/api/products', (req, res) => {
    database.getProducts( (err, product) => {
      if (err) return res.status(500).send(err);
      return res.status(200).send(product);
    }, null);
});

//POST v_02 :
// app.post('/api/products', upload.array("uploader"), function(req, res) {
//   console.log("T-Shirt envoyé ! ", req.body, "Files =>", req.files);
//   database.createProducts(function(product) {
//     res.send(product);
//   }, req.body);
// });

//POST
app.post('/api/products', function(req, res) {
  console.log("T-Shirt envoyé ! ", req.body);
  database.createProducts(function(product) {
    res.send(product);
  }, req.body);
});

//POST IMG
app.post("/api/upload", upload.array("uploader"), function(req, res, next) {
  console.log('upload request==>', req.files[0].originalname)
  res.send(req.files[0].originalname)
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