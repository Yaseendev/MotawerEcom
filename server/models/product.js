const mongoose = require('mongoose');
const ratingSchema = require("./rating");

const productSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },
    desc : {
        type: String,
        required: true,
    },
    images: [
        {
            type: String,
            required: true,
        },
    ],
    quantity: {
        type: Number,
        required: true,
    },
    price: {
        type: Number,
        required: true,
    },
    category : {
        type: String,
        required: true,
    },
    ratings: [ratingSchema],
});

const Product = mongoose.model('Product', productSchema);
module.exports = {Product, productSchema};