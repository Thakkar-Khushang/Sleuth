const router = require('express').Router();

const criminalController = require('../controllers/criminal');

router.post('/findCriminal', upload.single("file"), criminalController.findCriminal);

module.exports = router;