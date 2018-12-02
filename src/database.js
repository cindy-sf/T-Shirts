const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'tshirts'
});

connection.connect();

const end = function end() {
    connection.end();
};

//Get Produits
const getProducts = function getProducts(clbk, id) {

    let sql;
  
    // sql = "SELECT * FROM product INNER JOIN brand WHERE brand.id = product.id_brand";

    sql = "SELECT product.id, product.reference, product.price, product.url_img, description, brand.name as brand FROM product INNER JOIN brand ON brand.id = product.id_brand";

    connection.query(sql, [id], (error, results, fields) => {
      if (error) return clbk(error, null);
      return clbk(null, results);
    });

};

// Create Products
const createProducts = function createProducts(clbk, payload) {
    console.log("---------------------------");
    console.log("Payload ==>", payload);
    console.log("---------------------------");
    var data = [payload.id_brand, payload.reference, payload.price, payload.color, payload.url_img, payload.description];
    var sql = "INSERT INTO product (id_brand, reference, price, color, url_img, description) VALUES (?, ?, ?, ?, ?, ?)";
    connection.query(sql, data, (err, res, cols) => {
      if (err) throw err;
      console.log(res);
      return clbk(res);
    });
};

//Delete Product
const deleteProducts = function deleteProducts(clbk, id) {
    let sql = "DELETE FROM `product` WHERE `product`.`id` = ?";
    connection.query(sql, [id], function (err, res, fields) {
      if (err) throw err;
      return clbk(res);
    });
};
  
//Update Product
const updateProduct = function updateProduct(clbk, product) {
    let sql = "UPDATE product SET reference = ?, price = ?, url_img = ?, description = ? WHERE id = ?";
    const payload = [product.reference, product.price, product.url_img, product.description, product.id];
    const query = connection.query(sql, payload, function (err, res, fields) {
      if (err) return clbk(err, null);
      return clbk(null, res);
    });
    console.log("last query =", query.sql)
};


module.exports = {
    getProducts,
    createProducts,
    deleteProducts,
    updateProduct,
};