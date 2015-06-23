const React = require('react/addons');
const Router= require('react-router');
const Table = require('./table');
const Test = require('./test');
const NotFound = require('./notfound');

const {DefaultRoute, NotFoundRoute, Route, RouteHandler} = require('react-router');

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

const approutes = {
	wrapComponent(Component, props) {
	  return React.createClass({
	    render: function() {
	      return React.createElement(Component, props);
	    }
	  });
	},

	getRoutes(data){
		const routes = (
			<Route hander={App}>
				<DefaultRoute handler={this.wrapComponent(Table, {initialTeams: data})}/>
				<NotFoundRoute handler={NotFound}/>
				<Route path="standings" handler={this.wrapComponent(Table, {initialTeams: data})}/>
				<Route path="node" handler={this.wrapComponent(Table, {initialTeams: data})}/>
				<Route path="test" handler={Test}/>
			</Route>
		);
		return routes;
	},

	attach(elem, data){
		Router.run(this.getRoutes(data), Router.HistoryLocation, function(Handler, state) {
		  React.render(<Handler/>, elem);
		});	
	}
};

module.exports = approutes;
if (typeof window !== "undefined") {
	window.Router = approutes;
}