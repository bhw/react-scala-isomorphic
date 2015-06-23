const React = require('react/addons');
const { Link } = require('react-router');

const About = React.createClass({
	mixins: [React.addons.PureRenderMixin],

	render: function() {
		return (
			<div>
				Standings calculated from the 2014 Men's World Cup.
				<br/>
				<Link to={`/standings`}>Return to standings</Link>
			</div>
		);
	}
});

module.exports = About;
if (typeof window !== 'undefined') {
	window.About = About;
}