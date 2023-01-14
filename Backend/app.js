require("@tensorflow/tfjs-node");
const faceapi = require("@vladmandic/face-api");
const express = require("express");
const cors = require("cors");
const mongoose = require("mongoose");
require("dotenv").config();

const app = express();

app.use((req, res, next) => {
    res.header("Access-Control-Allow-Origin", "*");
    res.header(
      "Access-Control-Allow-Headers",
      "Origin, X-Requested-With, Content-Type, Accept, Authorization, auth-token"
    );
    if (req.method === "OPTIONS") {
      res.header("Access-Control-Allow-Methods", "PUT, POST, PATCH, DELETE, GET");
      return res.status(200).json({});
    }
    next();
  });

app.use(cors());

const Criminal = require("./models/criminal");

app.get("/", (req, res) => {
    return res.status(200).json({
        message: "Server is up and running",
    });
});
app.use("/",require("./routes/criminal.js"));

const port = process.env.PORT || 3000;

app.listen(port, async () => {
    await faceapi.nets.ssdMobilenetv1.loadFromDisk("weights");
  await faceapi.nets.faceRecognitionNet.loadFromDisk("weights");
  await faceapi.nets.faceLandmark68Net.loadFromDisk("weights");
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