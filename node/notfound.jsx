const React = require('react/addons');

const NotFound = React.createClass({
	mixins: [React.addons.PureRenderMixin],

	render: function() {
		return (
			<div>
				We couldn't find what you are looking for.  This link can take you back to a good place.
				<br/>
				<Link to={`/node`}>Return to standings</Link>
			</div>
		);
	}
});

module.exports = NotFound;
if (typeof window !== 'undefined') {
	window.Test = NotFound;
}