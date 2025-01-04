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

// Create search 
router.get('/api/products/search/:name', auth, async (req, res) => {
    try {
        const products = await Product.find({
            name: { $regex: req.params.name, $options: 'i' }
        });

        if (!products) {
            return res.status(404).json({ error: 'Products not found' });
        }

        res.json(products);
    } catch (err) {
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Create a post request to rate a product
router.post('/api/rate-product', auth, async (req, res) => {
    try {
        const { id, rating } = req.body;
        let product = await Product.findById(id);

        for (let i = 0; i < product.ratings.length; i++) {
            if (product.ratings[i].userId == req.user) {
                product.ratings.splice(i, 1);
                break;
            }
        }

        const ratingSchema = {
            userId: req.user,
            rating,
        };

        product.ratings.push(ratingSchema);
        product = await product.save();
        res.json(product);
    }
    catch (err) {
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

router.get("/api/deal-of-day", auth, async (req, res) => {
  try {
    let products = await Product.find({});

    products = products.sort((a, b) => {
      let aSum = 0;
      let bSum = 0;

      for (let i = 0; i < a.ratings.length; i++) {
        aSum += a.ratings[i].rating;
      }

      for (let i = 0; i < b.ratings.length; i++) {
        bSum += b.ratings[i].rating;
      }
      return aSum < bSum ? 1 : -1;
    });

    res.json(products[0]);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = router;