const React = require('react/addons');

const Row = React.createClass({
	mixins: [React.addons.PureRenderMixin],

	propTypes: {
		data: React.PropTypes.object.isRequired,
		columns: React.PropTypes.arrayOf(React.PropTypes.string).isRequired,
		index: React.PropTypes.number.isRequired
	},

	render() {
		return (
			<tr>
				<td className={this.props.index % 2 === 0 ? '' : 'odd'}>{this.props.index + 1}</td>
				<td className={this.props.data.goals_against > 6 ? 'red' : ''}>{this.props.data.goals_against}</td>
				<td className={this.props.data.goals_for > 10 ? 'green' : ''}>{this.props.data.goals_for}</td>
				<td className={this.props.data.goals_points > 15 ? 'blue' : ''}>{this.props.data.points}</td>
				<td className={this.props.index % 2 === 0 ? '' : 'odd'}>{this.props.data.team}</td>
				<td className={this.props.data.goal_diff < 0 ? 'red' : ''}>{this.props.data.goal_diff}</td>
				<td className={this.props.data.draw > 2 ? 'blue' : ''}>{this.props.data.draw}</td>
				<td className={this.props.data.loss > 3 ? 'red' : ''}>{this.props.data.loss}</td>
				<td className={this.props.data.games > 10 ? 'blue' : ''}>{this.props.data.games}</td>
				<td className={this.props.data.win > 3 ? 'green' : ''}>{this.props.data.win}</td>
				<td>{this.props.data.goalsPerGame}</td>
			</tr>
		);
	}
});

module.exports = Row;
if (typeof window !== 'undefined') {
	window.Row = Row;
}