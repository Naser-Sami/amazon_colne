
// IMPORT LIBRARIES
const express = require('express');
const mongoose = require('mongoose');

// IMPORT FROM OTHER FILES
const authRoutes = require('./routes/auth');
const adminRoutes = require('./routes/admin');


// INITIALIZE
const PORT = 3000;
const app = express();
const password = "";
const db = ``;


// MIDDLEWARE
app.use(express.json())
app.use(authRoutes);
app.use(adminRoutes);

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
