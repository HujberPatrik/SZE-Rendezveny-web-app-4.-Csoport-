const pool = require('../config/db');


const getAllKerveny = async (req, res) => {
    try {
      const result = await pool.query('SELECT * FROM kerveny');
      res.status(200).json(result.rows);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
};  
const insertKerveny = async (req,res) => {
  const {nev,helyszin,email,statusz,telefon,letszam} = req.body;

  try {
    const query = 'INSERT INTO kerveny(nev, helyszin, email, statusz,telefon,letszam) VALUES($1, $2, $3, $4, $5, $6)';
    const values = [nev, helyszin, email,statusz,telefon,letszam];

    await pool.query(query, values);
    res.status(200).json({msg: "Sikeres hozzáadás"});
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

const updateKerveny = async (req, res) => {
  const { id, nev, email, statusz, telefon, letszam } = req.body;

  try {
      const query = `UPDATE kerveny 
                     SET nev = $1, email = $2, statusz = $3, telefon = $4, letszam = $5 
                     WHERE id = $6 
                     RETURNING *`;
      const values = [nev, email, statusz, telefon, letszam, id];

      const result = await pool.query(query, values);
      if (result.rowCount === 0) {
          res.status(404).json({ error: 'Data not found' });
      } else {
          res.status(200).json(result.rows[0]);
      }
  } catch (err) {
      console.error('Error updating data:', err.message);
      res.status(400).json({ error: err.message });
  }
};

module.exports = {getAllKerveny, insertKerveny, updateKerveny  };