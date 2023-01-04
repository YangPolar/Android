const express = require('express');
const User = require('../models/user.js');
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');
const authRouter = express.Router();

// get user data
authRouter.get("/user", (req, res) => {
  res.json({msg : "Yang"});
});

// SIGNUP
authRouter.post("/api/signup", async (req, res) => {
    try {
        // Get data from client
        console.log(req.body);
        const {name, email, password} = req.body;
        // name: "Yang", email : "**", password: "***"
        const existUser = await User.findOne({ email });
        if (existUser) {
            return res.status(400).json({ msg: 'Email already exists.'});
        }

        const hashPassword = await bcryptjs.hash(password, 8);
        let user = new User({
            name,
            email,
            password: hashPassword,
        })
        // Post data to DB
        user = await user.save();
        // Return result
        res.json(user);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// SIGNIN
authRouter.post("/api/signin", async (req, res) => {
    try {
        // Get data from client
        console.log('/api/signin: ' + req.body);
        const {email, password} = req.body;
        const loginUser = await User.findOne({ email });
        if (!loginUser) {
            return res.status(400).json({ msg: 'Email does not exist.'});
        }

        const isMatch = await bcryptjs.compare(password, loginUser.password)
        if (!isMatch) {
            return res.status(400).json({ msg: 'Incorrect password.'});
        }

        const token = jwt.sign({id: loginUser._id}, "passwordKey");
        // ...means data structure
        res.json({ token, ...loginUser._doc });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Without this, this file coding will consider as private and can't use outside.
module.exports = authRouter;
//module.exports = { authRouter, name: "Yang"};