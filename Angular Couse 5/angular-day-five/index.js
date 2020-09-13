const express = require('express')
const cookieParser = require('cookie-parser')
const session = require('express-session')
const fs = require('fs')
var xl = require('excel4node');
const xlsxFile = require('read-excel-file/node');
const app = express()


app.set ( "view engine", "ejs" );

app.use(session({ 
    secret: "keyboard cat", 
    resave: true, 
    saveUninitialized: true,
    cookie: {maxAge:360000}
    })
)


app.use(cookieParser())

app.get('/', (req,res) =>{
    res.render("home",{
        labels:["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
        data:[12, 19, 3, 5, 2, 3]
    })
})

app.get('/session', (req,res) =>{
    req.session.email = 'test@hotmail.co.th'
    res.json({status : 'success'})
})

app.get('/cookies', (req,res) =>{
    console.log(req.cookies["myName"]);
    res.json(req.cookies["myName"])
    res.end()
})


app.get("/setCookies", (req, res) => {
    res.cookie("myName", "Oh Year", {
      maxAge: 1000 * 60 * 60,
      
    });
    res.send({status : 'success'})
    res.end();

});

app.get('/readtext', (req,res) =>{
    let text = fs.readFileSync('test.txt', 'utf-8')
    res.json(text)
    res.end()
})

app.get('/writetext', (req,res) =>{
    fs.writeFileSync('test.txt', 'Hellow Party', (err) =>{
        if(err) {
            return console.log(err);
        }
        console.log("The file was saved!");
    })
    res.json({status: 'success'})
    res.end()
})

app.get('/readexcel', (req,res) =>{
    xlsxFile('Excel.xlsx').then((rows) => {
        console.log(rows);
        console.table(rows);
    })
    res.json({status: 'success'})
    res.end()
})


app.get('/export', (req, res) =>{
var wb = new xl.Workbook();
 
// Add Worksheets to the workbook
var ws = wb.addWorksheet('Sheet 1');
var ws2 = wb.addWorksheet('Sheet 2');
 
// Create a reusable style
var style = wb.createStyle({
  font: {
    color: '#FF0800',
    size: 12,
  },
  numberFormat: '$#,##0.00; ($#,##0.00); -',
});
 
// Set value of cell A1 to 100 as a number type styled with paramaters of style
ws.cell(1, 1)
  .number(100)
  .style(style);
 
// Set value of cell B1 to 200 as a number type styled with paramaters of style
ws.cell(1, 2)
  .number(200)
  .style(style);
 
// Set value of cell C1 to a formula styled with paramaters of style
ws.cell(1, 3)
  .formula('A1 + B1')
  .style(style);
 
// Set value of cell A2 to 'string' styled with paramaters of style
ws.cell(2, 1)
  .string('string')
  .style(style);
 
// Set value of cell A3 to true as a boolean type styled with paramaters of style but with an adjustment to the font size.
ws.cell(3, 1)
  .bool(true)
  .style(style)
  .style({font: {size: 14}});
 
wb.write('Excel.xlsx', res);
})


app.listen(60, () =>{
    console.log("Connection Port 60")
})