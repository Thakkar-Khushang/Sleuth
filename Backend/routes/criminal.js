const router = require('express').Router();
const multer = require("multer");

const criminalController = require('../controllers/criminal');

const storage = multer.memoryStorage();
  
  var upload = multer({
    storage: storage,
    limits: {
      fileSize: 1024 * 1024 * 5,
    },
  });

router.post('/findCriminal', upload.single("file"), criminalController.findCriminal);

module.exports = router;