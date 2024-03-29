const jwt= require('jsonwebtoken');
const User = require('../models/user');

const admin = async (req, res, next) => {
    try {
        const token = req.header('x-auth-token');
        if(!token) return res.status(401).json({error: 'No auth token, access denied'});

        const verified = jwt.verify(token, "passwordKey");
        if(!verified) return res.status(401).json({error: "Token verification faild, authorization denied"});
        const user = await User.findById(verified.id);
        if(user.type == 'user' || user.type == 'seller') {
            return res.status(403).json({error: 'This account is not an admin account'});
        }
        req.user = verified.id;
        req.token = token;
        next();
    } catch (error) {
        res.status(500).json({error: error.message});
    }
}
module.exports = admin;