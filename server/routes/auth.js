// CREATE AN API
// GET, POST, PUT, DELETE - CRUD
// http://<your-ip-address>/


// Import express
const express = require('express');
const User = require('../models/user')
const auth = require('../middlewares/auth');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

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

    // Create a token
    const token = jwt.sign({ id: user._id }, "passwordKey");

    // Send a response back to the client ( return the data )
    res.json({token, ...user._doc});
    
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Login
router.post("/api/login", async (req, res) => {
    try {
        const { email, password } = req.body;
        
        // Check if the user exists
        const user = await User.findOne({ email });
        if (!user) {
            return res.status(400).json({ msg: "User with that email does not exist." });
        }
        // Check if the password is correct
        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ msg: "Invalid credentials." });
        }

        // Create a token
        const token = jwt.sign({ id: user._id }, "passwordKey");

        // Send a response back to the client ( return the data )
        res.json({ token, ...user._doc });
    } 
        catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// verify token
router.post("/tokenIsValid", async (req, res) => {
    try {
        const token = req.header("x-auth-token");
        console.log(`TOKEN: ${token}`);

        if (!token) return res.json(false);

        const verified = jwt.verify(token, "passwordKey");
        console.log(`TOKEN VERIFIED: ${verified}`);
        if (!verified) return res.json(false);
        
        // Get the user from the database
        const user = await User.findById(verified.id);
        console.log(`USER: ${user}`);
        if (!user) return res.json(false);
        
        res.json(true);
    }
        catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Get user data
router.get("/", auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
});

// Export the router object
module.exports = router;