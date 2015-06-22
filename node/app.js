const koa = require('koa');
//const staticServer = require('koa-static');
//const parse = require('co-body');
//const path = require('path');
const views = require('koa-views');
const router = require('koa-router');
//const underscore = require('underscore');
const bodyParser = require('koa-body-parser');

const React = require('react');
const Table = React.createFactory(require('./server'));
//const Router = React.createFactory(require('./server'));

//var send = require('koa-send');

const app = module.exports = koa();

//views
app.use(views('./views', {
  map: {
    html: 'underscore'
  }
}));

//serve up the public directory where we have all the assets
//app.use(staticServer(path.join(__dirname, '_public')));

// logger
app.use(function *(next){
  const start = new Date();
  yield next;
  const ms = new Date() - start;
  console.log('%s %s - %s', this.method, this.url, ms);
});

app.use(bodyParser());

app.use(router(app))
.get('/', function *(){
  this.body = 'yes!';
})
.post('/render', function *(){
  console.log(this.request.body.view);
  yield this.render(this.request.body.view, {
    body: React.renderToString(Table({
      initialTeams: this.request.body.content
    })),
    teams: JSON.stringify(this.request.body.content)
  });
});

app.listen(3000);