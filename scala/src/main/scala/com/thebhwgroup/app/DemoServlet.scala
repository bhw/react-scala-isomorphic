package com.thebhwgroup.app

import org.scalatra._
import scalate.ScalateSupport
import org.json4s._
import org.json4s.jackson.JsonMethods._
import org.slf4j.{Logger, LoggerFactory}
import scalikejdbc._
import org.json4s.{DefaultFormats, Formats}
import org.scalatra.json._
import org.json4s.native.Serialization.{ read, write, writePretty }

import dispatch._, Defaults._
import scala.concurrent.{ExecutionContext, Future, Promise}
import _root_.akka.actor.{Actor, ActorRef, ActorSystem, Props}
import _root_.akka.dispatch._
import org.scalatra.{ScalatraServlet, FutureSupport, AsyncResult}

case class CupResult(goals_against: Int, _id: String, goals_for: Int, _rev: String, points: Int, team: String,
 goal_diff: Int, draw: Int, loss: Int, games: Int, win: Int)

class DemoServlet(system:ActorSystem) extends DemoStack with JacksonJsonSupport with FutureSupport {
  protected implicit def executor: ExecutionContext = system.dispatcher
  protected implicit val jsonFormats: Formats = DefaultFormats

  //setup the logger
  val logger =  LoggerFactory.getLogger(getClass)

  //create the postgres connection pool
  //TODO: change this to your database and user
  ConnectionPool.singleton("jdbc:postgresql://localhost:5432/worldcup", "brett", "")

  //next three get methods can be used to check that Scalatra is working and the database is correctly configured
  //rendering via scalate view engine (ssp)
  get("/hello-scalate"){
    contentType="text/html"
    ssp("/hello-scalate")
  }

  //example json endpoint
  get("/all"){
    contentType = "application/json"
    teams()
  }

  //default html page showing data rendered via scalatra
  get("/") {

    val teams: List[CupResult] = DB readOnly { implicit session =>
      sql"select * from result"
        .map(rs => CupResult(rs.int("goals_against"), rs.string("id"), rs.int("goals_for"),
          rs.string("rev"), rs.int("points"), rs.string("team"), rs.int("goal_diff"), rs.int("draw"),
          rs.int("loss"), rs.int("games"), rs.int("win") )).list.apply()
    }
  }

  //handle errors
  /*error {
    case t: Throwable => t.printStackTrace()
  }*/

  //used to insert a team to the database
  def insertTeam(team : CupResult):Boolean = {
    implicit val session = AutoSession

    val result: Boolean = sql"""
        insert into result(team, id, goals_against, goals_for, points, goal_diff, draw, loss, win, games)
        values(${team.team}, ${team._id}, ${team.goals_against}, ${team.goals_for}, ${team.points}, ${team.goal_diff}, ${team.draw},
          ${team.loss}, ${team.win}, ${team.games})
          """.execute.apply()
    result
  }

  //return list of all CupResults in the database
  def teams():List[CupResult] = {
    val results: List[CupResult] = DB readOnly { implicit session =>
      sql"select * from result"
        .map(rs => CupResult(rs.int("goals_against"), rs.string("id"), rs.int("goals_for"),
          rs.string("rev"), rs.int("points"), rs.string("team"), rs.int("goal_diff"), rs.int("draw"),
          rs.int("loss"), rs.int("games"), rs.int("win") )).list.apply()
    }
    results
  }

  //class for serializing the request we'll send to node
  case class RenderRequest(view: String, content: List[CupResult])

  //our asynchronous, non-blocking, isomorphic, react endpoint
  get("/node"){
    contentType = "text/html"
    new AsyncResult{
      val is =  Future {
        //build our node request
        val render = RenderRequest("team-list", teams)

        //build json string of our RenderRequest
        val json = write(render)

        //dispatch the rendering async to Akka and node
        DispatchAkka.renderPage(json)
      }
    }
  }

  //TODO: improvement - configure timeouts?
  //import akka.util.Timeout
  //implicit val defaultTimeout = Timeout(10)
  import _root_.akka.pattern.ask
}

//create an asynchronous request to node
object DispatchAkka {
  def renderPage(json: String)(implicit ctx: ExecutionContext): Future[String] = {
    val myHost = host("localhost", 3000)
    val myRequest = myHost
    def myRequestAsJson = myRequest.setContentType("application/json", "UTF-8")
    def post = myRequestAsJson << json
    dispatch.Http(post OK as.String)
  }
}

//TODO: improvement -  code organization
//TODO: improvement -  error handling from async post?
//TODO: improvement -  404 route?
//TODO: improvement -  better error handling and stack traces?
