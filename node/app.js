const koa = require('koa');
const views = require('koa-views');
const router = require('koa-router');
const bodyParser = require('koa-body-parser');

const React = require('react');
const Router = require('react-router')
const AppRoutes = require('./router');
const co = require('co');
const uuid = require('uuid');

const app = module.exports = koa();

function wrapRouteRun(router){
	return new Promise((resolve,reject) => {
		try{
			//how does error surface?
			router.run( (Handler, state) => {
				const body = React.renderToString(React.createElement(Handler, null));
				resolve(body);
			});
		} catch(e){
			reject(e);
		}
	});
}

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
	const data = this.request.body.content;
	const view = this.request.body.view;
	console.log('rendering view', view);

	const router = Router.create({
		location: this.request.url,
		routes: AppRoutes.getRoutes(data)
	});

	//const that = this;
	try {
		const body = yield wrapRouteRun(router);
		yield this.render(view, {
			body: body,
			cacheBuster: uuid.v4(),
			teams: JSON.stringify(data)
		});
	} catch (e) {
		console.log('router.run exception', e);
	}
	
	
});

app.listen(3000);