const express = require('express');
const router = express.Router();
const controller = require('../controllers/appController');

router.get('/', controller.home);
router.get('/health', controller.health);

module.exports = router;