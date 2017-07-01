let fs = require('fs'),
    express = require('express'),
    port   = 3000,
    app    = express();

app.get('/', (req, res, fn) => 
  fs.readFile('./src/index.html', 'utf-8', (err, content) => res.end(content)));

app.use('/', express.static(__dirname + '/src/'));

app.listen(port, err => {
  if (err) return console.err(err);
  
  console.log(`listening on http://localhost:${ port }`);
});
