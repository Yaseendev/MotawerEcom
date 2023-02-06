const express = require('express');
const User = require('../models/user');
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');
const authRouter = express.Router();
const auth = require('../middleware/auth_middleware');

///Signup Api
authRouter.post("/api/signup", async function (req, res) {
    try {
        const {name, email, password} = req.body;
        const existingUser = await User.findOne({email}); // email: email
        if(existingUser) {
            return res.status(400).json({msg: "User with the same email already exists!"});
        }
        
        const hashedPassword = await bcryptjs.hash(password, 8); 
        let user = new User({
    email, password: hashedPassword, name
        });
        user = await user.save();
        res.json(user); //{user: user}
    } catch (error) {
        res.status(500).json({error: error.message});
    }
   
});

///Signin Api
authRouter.post("/api/signin", async (req, res) => {
    try {
        const { email, password} = req.body;
        const existingUser = await User.findOne({email}); // email: email
        if(!existingUser) {
            return res.status(400).json({error: "User with this email does not exist!"});
        }
        const isPasswordMatch = await bcryptjs.compare(password, existingUser.password); 
        if(!isPasswordMatch) {
            return res.status(400).json({error: "Incorrect Password"})
        }
        const token = jwt.sign({id: existingUser._id}, "passwordKey");
        res.json({token, ...existingUser._doc});
    } catch (error) {
        res.status(500).json({error: error.message});
    }
   
});

///Token verify Api
authRouter.post("/api/tokencheck", async (req, res) => {
    try {
        const token = req.header('x-auth-token');
        if(!token) return res.json(false);
        const verified = jwt.verify(token, "passwordKey");
        if(!verified) return res.json(false);

        const user = await User.findById(verified.id);
        if(!user) return res.json(false);
        return res.json(true);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
});

/// Get User Data
authRouter.get('/api', auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({...user._doc, token: req.token});
});

module.exports = authRouter;
