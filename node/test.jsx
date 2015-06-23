const React = require('react/addons');
const { Link } = require('react-router');

const Test = React.createClass({
	mixins: [React.addons.PureRenderMixin],

	propTypes: {
		message: React.PropTypes.string.isRequired
	},

	render: function() {
		return (
			<div>
				Hello {this.props.message}
				<br/>
				<Link to={`/node`}>Return to standings</Link>
			</div>
		);
	}
});

module.exports = Test;
if (typeof window !== 'undefined') {
	window.Test = Test;
}