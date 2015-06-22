const React = require('react/addons');
const _ = require('lodash');
const Row = require('./row');
const Router= require('react-router');
import { Link } from 'react-router';

const Table = React.createClass({
	mixins: [React.addons.PureRenderMixin],

	propTypes: {
		initialTeams: React.PropTypes.arrayOf(React.PropTypes.object).isRequired
	},

	getInitialState: function() {
		return {
			teams: this.props.initialTeams.map( team => {
				team.goalsPerGame = this.goalsPerGame(team.games, team.goals_for);
				return team;
			})
		};
	},

	columns: [
		'goals_against',
		'goals_for',
		'points',
		'team',
		'goal_diff',
		'draw',
		'loss',
		'games',
		'win',
		'gpg'
	],

	handleGermanyClick: function() {
		const germanyIndex = _.findIndex(this.state.teams, x => x.team === 'Germany');
		const teamsClone = _.clone(this.state.teams);
		const germanyClone = _.clone(this.state.teams[germanyIndex]);
		germanyClone.games++;
		germanyClone.goalsPerGame = this.goalsPerGame(germanyClone.games, germanyClone.goals);
		teamsClone[germanyIndex] = germanyClone;
		this.setState({ teams: teamsClone });
	},

	handleAllClick: function() {
		const teamsClone = _.cloneDeep(this.state.teams);
		teamsClone.map(team => {
			team.games++;
			team.goalsPerGame = this.goalsPerGame(team.games, team.goals_for);
			return team;
		});
		this.setState({teams: teamsClone});
	},

	calcTotalGames: function() {
		return _.reduce(this.state.teams, function(total, team){
											if( total ){
												return parseInt(total) + parseInt(team.games);
											} else {
												return parseInt(team.games);
											} });
	},

	goalsPerGame: function(games, goals) {
		return goals / games;
	},

	render: function() {
		const sortedTeams = _.sortByOrder(this.state.teams, 'goalsPerGame', [false]);
		return (
			<div>
				<button onClick={this.handleGermanyClick}>Germany</button>
				<button onClick={this.handleAllClick}>All</button>
				<Link to={`/test`}>About</Link>
				
				<div>{this.calcTotalGames()}</div>
				<table>
					<thead>
						<tr>
							<th>rank</th>
							{this.columns.map(name =>
								<th key={'th-' + name}>{name}</th>
							)}
						</tr>
					</thead>
					<tbody>
						{sortedTeams.map((team, outerIndex) =>
							<Row key={'row-' + outerIndex}
								data={sortedTeams[outerIndex]}
								index={outerIndex}
								columns={this.columns} />
						)}
					</tbody>
				</table>
			</div>
		);
	}
});

module.exports = Table;
if (typeof window !== 'undefined') {
	window.Table = Table;
}