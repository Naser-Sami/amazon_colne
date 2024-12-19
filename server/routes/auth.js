// CREATE AN API
// GET, POST, PUT, DELETE - CRUD
// http://<your-ip-address>/


// Import express
const express = require('express');
const User = require('../models/user')
const bcrypt = require('bcryptjs');

// Create a router object
const router = express.Router();

// Create a POST route
router.post("/api/sign-up", async (req, res) => {

    try {
        // Get the data from the request body ( client )
    const { name, email, password } = req.body;

    
    // HANDEL VALIDATION
    // - Check on existing user ( Email must be uniq )
    const existingUser = await User.findOne({email});

    if (existingUser) {
        return res.status(400).json({ msg: "User with the same email already exist." });
    }

    // - Hash the password
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    // Post the data to the database ( mongodb )
    let user = new User({
        name,
        email,
        password: hashedPassword,
    })

    user = await user.save();

    // Send a response back to the client ( return the data )
    res.json(user);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});


// Export the router object
module.exports = router;