
const express = require('express');
const admin = require('../middlewares/admin');
const Product = require('../models/product');

// Create a router object
const adminRoutes = express.Router();

// Add product 
adminRoutes.post('/admin/add-product', admin, async (req, res) => {
    try {
        const { name, description, images, quantity, price, category } = req.body;

        let product = new Product({
            name,
            description,
            images,
            quantity,
            price,
            category
        });

        product = await product.save();
        res.json(product);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Get all products
adminRoutes.get('/admin/get-products', admin, async (req, res) => {
    try {
        const products = await Product.find();
        res.json(products);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Delete a product
adminRoutes.delete('/admin/delete-product/:id', admin, async (req, res) => {
    try {
        const productId = req.params.id;
        await Product.findByIdAndDelete(productId);
        res.json({ message: 'Product deleted successfully' });

    } catch (err) {
        console.log(err);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});



module.exports = adminRoutes;