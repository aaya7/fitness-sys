const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const { findUserByUsername, createUser } = require('../models/userModel');

const login = async (req, res) => {
    try {
        const { username, password } = req.body;

        console.log("Incoming Body:", req.body);

        const results = await findUserByUsername(username);

        if (!results || results.length === 0) {
            return res.status(400).json({ message: 'User not found' });
        }

        const user = results[0];
        console.log("DB User Hash found:", user.password_hash);

        const match = await bcrypt.compare(password, user.password_hash);
        if (!match) {
            return res.status(400).json({ message: 'Wrong password' });
        }

        if (!user.is_active) {
            return res.status(403).json({ message: 'Account inactive' });
        }

        const token = jwt.sign(
            { id: user.id, role: user.role },
            process.env.JWT_SECRET,
            { expiresIn: '1h' }
        );

        return res.json({ token });

    } catch (err) {
        console.error("Login Error:", err);
        return res.status(500).json({ message: "Internal server error" });
    }
};

const register = async (req, res) => {
    try {
        const { username, password, email } = req.body;

        // validation
        if (!username || !password || !email) {
            return res.status(400).json({ message: "All fields are required" });
        }

        // check if user exists
        const existingUser = await findUserByUsername(username);
        if (existingUser && existingUser.length > 0) {
            return res.status(400).json({ message: "Username already taken" });
        }

        // password hashing
        const hashedPassword = await bcrypt.hash(password, 10);

        await createUser(username, hashedPassword, email);
        console.log("User registered:", username, email, hashedPassword);

        return res.status(201).json({ message: "User registered successfully!" });

    } catch (err) {
        console.error("Registration Error:", err);
        if (err.code === 'ER_DUP_ENTRY') {
            return res.status(400).json({ message: "Email or Username already exists" });
        }
        return res.status(500).json({ message: "Internal server error" });
    }
};

module.exports = { login, register };