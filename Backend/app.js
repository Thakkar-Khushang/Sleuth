const express = require("express");
const cors = require("cors");
const mongoose = require("mongoose");
require("dotenv").config();

const app = express();

app.use(express.json({}));
app.use(cors());

const Criminal = require("./models/criminal");

app.get("/", (req, res) => {
    return res.status(200).json({
        message: "Server is up and running",
    });
});

const port = process.env.PORT || 3000;

app.listen(port, async () => {
    mongoose.set("strictQuery", false);
    await mongoose
        .connect(process.env.DB_URI, {
            useNewUrlParser: true,
            useUnifiedTopology: true,
        })
        .then(() => {
            Criminal.init();
            console.log("Database Connected");
        })
        .catch((err) => {
            console.log(`Database error >> ${err.toString()}`);
        });
    mongoose.Promise = global.Promise;
    console.log(`Server is running on port ${port}`);
});