const express = require('express');
const adminRouter = express.Router();
const adminMW = require('../middleware/admin_middleware');
const Product = require('../models/product');

/// Add Product
adminRouter.post("/api/admin/add-product", adminMW, async (req, res) => {
try {
    const {name, desc, images, quantity, price, category} = req.body;
    let product = new Product({
        name,
         desc,
          images,
           quantity,
            price, 
        category,
    });
    product = await product.save();
    res.json(product);
} catch (error) {
    res.status(500).json({error: error.message});
}
});

/// Get All admin products
adminRouter.get("/api/admin/get-products", adminMW, async (req, res) => {
    try {
        const products = await Product.find({});
        res.json(products);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
    });

module.exports = adminRouter;