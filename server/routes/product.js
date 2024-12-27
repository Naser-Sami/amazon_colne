const express = require('express');
const auth = require('../middlewares/auth');
const Product = require('../models/product');

const router = express.Router();

// Get all products
// api/products?category=shoes
// params -> :
router.get('/api/products', auth, async (req, res) => {
    try {
        // Get the category from the query string
        const category = req.query.category;
        console.log(category);
        const products = await Product.find({ category: category });

        if (!products) {
            return res.status(404).json({ error: 'Products not found' });
        }

        res.json(products);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

module.exports = router;