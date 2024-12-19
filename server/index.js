
// IMPORT LIBRARIES
const express = require('express');
const mongoose = require('mongoose');

// IMPORT FROM OTHER FILES
const authRoutes = require('./routes/auth');


// INITIALIZE
const PORT = 3000;
const app = express();
const password = "add-your-password-here";
const db = `add-your-mongodb-uri-here`;


// MIDDLEWARE
app.use(express.json())
app.use(authRoutes);


// CONNECT TO MONGODB
mongoose.connect(db).then(() => {
    console.log("Connected to MongoDB successfully");
}).catch((err) => {
    console.log("Error connecting to MongoDB", err);
});


// START THE SERVER
app.listen(PORT, "0.0.0.0", () => {
    console.log(`Server listening on port ${PORT}`);
});
