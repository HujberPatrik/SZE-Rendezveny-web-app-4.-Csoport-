const pool = require('../config/db');


exports.getAllKerveny = async (req, res) => {
    try {
      const result = await pool.query('SELECT * FROM kerveny');
      res.status(200).json(result.rows);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
};  