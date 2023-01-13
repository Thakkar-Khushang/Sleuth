const router = require('express').Router();
const AWS = require("aws-sdk");
const multer = require("multer");
const multerS3 = require("multer-s3");

const criminalController = require('../controllers/criminal');

const storage = multer.memoryStorage();
  
  var upload = multer({
    storage: storage,
    limits: {
      fileSize: 1024 * 1024 * 5,
    },
  });

  var s3 = new AWS.S3({
    accessKeyId: process.env.AWS_KEY_ID,
    secretAccessKey: process.env.AWS_SECRET_KEY,
    signatureVersion: "v4",
    region: "ap-south-1",
  });

  const fileFilter = (req, file, cb) => {
    if (
      file.mimetype === "image/jpg" ||
      file.mimetype === "image/jpeg" ||
      file.mimetype === "image/png"
    ) {
      cb(null, true);
    } else {
      cb(null, false);
    }
  };
  
  var uploadS3 = multer({
    storage: multerS3({
      s3,
      bucket: "khushang-bucket",
      metadata: function (req, file, cb) {
        cb(null, { fieldName: file.fieldname });
      },
      key: function (req, file, cb) {
        cb(null, Date.now().toString() + "." + file.mimetype.split("/")[1]);
      },
    }),
    limits: {
      fileSize: 1024 * 1024 * 5,
    },
    fileFilter: fileFilter,
  });

router.post('/findCriminal', upload.single("file"), criminalController.findCriminal);
router.post('/uploadCriminal', uploadS3.single("file"), criminalController.uploadCriminal);

module.exports = router;