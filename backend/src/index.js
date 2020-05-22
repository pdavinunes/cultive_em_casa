 const express = require('express');
 const routes = require('./routes');
 const conexao = require('./conexao'); 

 const app = express();

 app.use(routes)

 app.listen(3333);