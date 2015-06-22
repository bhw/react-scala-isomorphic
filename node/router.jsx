const React = require('react/addons');
const Router= require('react-router');
const Table = require('./table');
const Test = require('./test');

const RouteHandler = Router.RouteHandler;
const Route = Router.Route;
const DefaultRoute = Router.DefaultRoute;

const App = React.createClass({
  render () {
    return (
      <div>
        <h1>App</h1>
        <RouteHandler/>
      </div>
    )
  }
});

const wrapComponent = function(Component, props) {
  return React.createClass({
    render: function() {
      return React.createElement(Component, props);
    }
  });
};

function attach(element, data){
	console.log('begin...');

	const routes = (
		<Route hander={App}>
			<DefaultRoute handler={wrapComponent(Table, {initialTeams: data})}/>
			<Route path="standings" handler={wrapComponent(Table, {initialTeams: data})}/>
			<Route path="node" handler={wrapComponent(Table, {initialTeams: data})}/>
			<Route path="test" handler={Test}/>
		</Route>
	);

	Router.run(routes, Router.HashLocation, (Root) => {
		React.render(<Root/>, element);
	});
}

module.exports = attach;
if (typeof window !== "undefined") {
	window.Router = attach;
}