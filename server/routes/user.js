const express = require('express');
const userRouter = express.Router();
const auth = require('../middleware/auth_middleware');
const {Product} = require('../models/product');
const User = require('../models/user');

/// Add To Cart
userRouter.post("/api/admin/add-to-cart", auth, async (req, res) => {
    try {
        const {id} = req.body;
        const product = await Product.findById(id);
        let user = await User.findById(req.user);
        
        if(user.cart.length == 0) {
            user.cart.push({product, quantity: 1});
        } else {
            let isFound = false;
            for(let i=0; i < user.cart.length; i++){
                if(user.cart[i].product._id.equals(product._id)) {
                    isFound = true;
                }
            }

            if(isFound) {
                let prod = user.cart.find((p) => p.product._id.equals(product._id));
                prod.quantity += 1;
            } else {
                user.cart.push({product, quantity: 1});
            }
        }
        user = await user.save();
        res.json(user);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
    });

module.exports = userRouter;    