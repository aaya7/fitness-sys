const userModel = require('../models/userModel');

const getUsers = async (req, res) => {
  try {
    const results = await userModel.getAllUsers();
    res.json(results);
  } catch (err) {
    res.status(500).json({ message: 'Failed to fetch Users', error: err });
  }
};

const addUser = async (req, res) => {
  try {
    const result = await userModel.addUser(req.body);
    res.json(result);
  } catch (err) {
    res.status(500).json({ message: 'Failed to add User', error: err });
  }
};

const updateUser = async (req, res) => {
  try {
    const result = await userModel.updateUser(req.params.id, req.body);
    res.status(200).json({ message: 'User updated successfully', result });
  } catch (err) {
    res.status(500).json({ message: 'Failed to update User', error: err });
  }
};

const deleteUser = async (req, res) => {
  try {
    const result = await userModel.deleteUser(req.params.id);
    res.json(result);
  } catch (err) {
    res.status(500).json({ message: 'Failed to delete User', error: err });
  }
};

module.exports = { getUsers, addUser, updateUser, deleteUser };
