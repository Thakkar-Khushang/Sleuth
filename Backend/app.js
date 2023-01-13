const express = require("express");
const cors = require("cors");

const app = express();

app.use(express.json({}));
app.use(cors());

app.get("/", (req, res) => {
    return res.status(200).json({
      message: "Server is up and running",
    });
});

const port = process.env.PORT || 3000;

app.listen(port, async () => {
    console.log(`Server is running on port ${port}`);
});