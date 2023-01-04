// Import from packages
const express = require('express');
const mongoose = require('mongoose');
// Import from other files
const authRouter = require('./routes/auth.js');

//INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://yangliming:1983718@cluster0.hifoyri.mongodb.net/?retryWrites=true&w=majority";

//middleware: client -> middleware -> server -> client
app.use(express.json());
app.use(authRouter);

//Connections
mongoose
    .connect(DB)
    .then(() => {
    console.log("MongoDB Connected.");
    }).catch ((e) => {
        console.log(e);
    });

// Creating an API Server
app.listen(PORT, "0.0.0.0", function () {
    console.log(`connected at port ${PORT}`);
});

// GET, POST, UPDATE, DELETE => CRUD
app.get('/hello', (req, res) => {
    res.send("hello");
})

app.get('/', (req, res) => {
    res.json({name : "Yang"});
})
