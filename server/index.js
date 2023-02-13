const express = require('express');
const mongoose = require('mongoose');
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
const productRouter = require('./routes/product');
const auth = require('./middleware/auth_middleware');

const app = express();
const PORT = 3000;
const DB = 'mongodb+srv://Yaseendev:Yaseendev123@cluster0.mih13oq.mongodb.net/?retryWrites=true&w=majority';

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);

//Connection to db
mongoose.connect(DB).then(() => {
    console.log('Connection Successful');
}).catch((e) => {
    console.log(e);
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connected to port ${PORT}`);
});
