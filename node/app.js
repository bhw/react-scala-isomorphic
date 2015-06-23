const koa = require('koa');
const views = require('koa-views');
const router = require('koa-router');
const bodyParser = require('koa-body-parser');

const React = require('react');
const Router = require('react-router')
const AppRoutes = require('./router');

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
.get('/test', function *(){
  //provide easy route for testing to make sure node is listening
  this.body = 'NodeJS running...';
})
.post('/', function *(){
  //the endpoint called from scala
  console.log('rendering view', this.request.body.view);

  const data = this.request.body.content;
  const view = this.request.body.view;

  const router = Router.create({
    location: this.request.url,
    routes: AppRoutes.getRoutes(data)
  });

  const that = this;
  this.body = yield router.run( (Handler, state) => {
    console.log('Handler', Handler);
    console.log('State', state);
    const body = React.renderToString(Handler);
    return that.render(view, {
      body: body,
      teams: JSON.stringify(data)
    });
  });
});

app.listen(3000);