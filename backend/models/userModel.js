const db = require('./database');
const bcrypt = require('bcrypt');

const getAllUsers = async () => {
    const [rows] = await db.query('SELECT * FROM users');
    return rows;
};

const getUserById = async (id) => {
    const [rows] = await db.query('SELECT * FROM users WHERE id = ?', [id]);
    return rows[0];
};

const addUser = async (userData) => {
    let { username, email, password_hash, phone } = userData;

    if (!password_hash) {
        password_hash = await bcrypt.hash('fitness', 10);
    }

    const [result] = await db.query(
        'INSERT INTO users (username, email, password_hash, phone) VALUES (?, ?, ?, ?)',
        [username, email, password_hash, phone]
    );
    return result;
}

const findUserByUsername = async (username) => {
    const [rows] = await db.query('SELECT * FROM users WHERE username = ?', [username]);
    return rows;
};

// used for public registration
const createUser = async (username, password_hash, email, phone) => {
    const [result] = await db.query(
        'INSERT INTO users (username, password_hash, email, phone) VALUES (?, ?, ?, ?)',
        [username, password_hash, email, phone]
    );
    return result;
};

const updateUser = async (id, userData) => {
    const { username, email, phone } = userData;
    const [result] = await db.query(
        'UPDATE users SET username=?, email=?, phone=? WHERE id=?',
        [username, email, phone, id]
    );
    return result;
};

const deleteUser = async (id) => {
    const [result] = await db.query('DELETE FROM users WHERE id=?', [id]);
    return result;
};

module.exports = {
    getAllUsers,
    getUserById,
    addUser,
    findUserByUsername,
    createUser,
    updateUser,
    deleteUser
};