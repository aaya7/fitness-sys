const express = require('express');
const router = express.Router();
const auth = require('../middleware/auth');
const { getUsers, addUser, updateUser, deleteUser } = require('../controllers/userController');

router.use(auth);

router.get('/', getUsers);
router.post('/', addUser);
router.put('/:id', updateUser);
router.delete('/:id', deleteUser);

module.exports = router;
