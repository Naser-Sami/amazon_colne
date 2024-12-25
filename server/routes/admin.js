
const express = require('express');
const admin = require('../middlewares/admin');

// Create a router object
const router = express.Router();

// Add product 
router.post('/admin/add-product', admin, async (req, res) => {
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

module.exports = router;