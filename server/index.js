const express = require('express');
const mongoose = require('mongoose');
const authRouter = require('./routes/auth');
const auth = require('./middleware/auth_middleware');

const app = express();
const PORT = 3000;
const DB = 'mongodb+srv://Yaseendev:Yaseendev123@cluster0.mih13oq.mongodb.net/?retryWrites=true&w=majority';

app.use(express.json());
app.use(authRouter);

//Connection to db
mongoose.connect(DB).then(() => {
    console.log('Connection Successful');
}).catch((e) => {
    console.log(e);
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connected to port ${PORT}`);
});


app.get("/test", (req, res) => {
    res.json([{ user: 'tj' }, { user: 'tj' }]);
});