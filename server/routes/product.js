const express = require('express');
const productRouter = express.Router();
const auth = require('../middleware/auth_middleware');
const {Product} = require('../models/product');

/// Get All products
productRouter.get("/api/products", auth, async (req, res) => {
    try {
        console.log(req.query.category);
        const products = await Product.find({category: req.query.category});
        res.json(products);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
    });

/// Search for product
productRouter.get("/api/products/search/:term", auth, async (req, res) => {
    try {
        const products = await Product.find({
            name: {$regex: req.params.term, $options: "i"},
        });
        res.json(products);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
    });

module.exports = productRouter;