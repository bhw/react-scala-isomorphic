const koa = require('koa');
const views = require('koa-views');
const router = require('koa-router');
const bodyParser = require('koa-body-parser');

const React = require('react');
const Table = React.createFactory(require('./server'));

const app = module.exports = koa();

//views
app.use(views('./views', {
  map: {
    html: 'underscore'
  }
}));

// log request execution times
app.use(function *(next){
  const start = new Date();
  yield next;
  const ms = new Date() - start;
  console.log('%s %s - %s', this.method, this.url, ms);
});

//wire up bodyParser to process posted JSON data
app.use(bodyParser());

app.use(router(app))
.get('/', function *(){
  //put something on the default route for easy testing to make sure node is listening
  this.body = 'NodeJS running...';
})
.post('/render', function *(){
  //the endpoint called from scala
  console.log('rendering view', this.request.body.view);
  yield this.render(this.request.body.view, {
    body: React.renderToString(Table({
      initialTeams: this.request.body.content
    })),
    teams: JSON.stringify(this.request.body.content)
  });
});

app.listen(3000);