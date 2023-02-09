const express =require('express');
const app = express();
const client = require ('./db')
const fs = require('fs')

const port = (process.env.PORT || 3000);

app.use(express.urlencoded({extended:false}));

const readFile = (path)=> {
  return new Promise((res, rej)=> {
    fs.readFile(path, (err, result)=> {
      if(err){
        rej(err);
      }
      else {
        res(result.toString());
            }});});};

app.get('/', async(req, res, next) =>{
  try{
    const response = await client.query(`
    SELECT *
    FROM bookmark
    `);
    const things = response.rows;
    res.send(`
    <html>
    <head><title>WTF</title></head>
    <body>
    <h1>DOES IT WORK??!?!?!?!</h1>
    <ul>  ${things.map
              (thing => `<li>${thing.name}</li>`).join(' ')}
    </ul>
    </body>
    </html>
    `)
  }
  catch(ex){
    next(ex);
  }
})


app.listen(port, async() => {
  try {
    console.log(`listening on ${port}`);
    await client.connect();
    const SQL = await readFile('./routes/db.sql')
    await client.query(SQL);
  }
    catch(ex){
      console.log(ex);
    }
  })