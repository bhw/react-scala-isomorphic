import sbt._
import Keys._
import org.scalatra.sbt._
import org.scalatra.sbt.PluginKeys._
import com.mojolly.scalate.ScalatePlugin._
import ScalateKeys._

object DemoBuild extends Build {
  val Organization = "com.thebhwgroup"
  val Name = "demo"
  val Version = "0.1.0-SNAPSHOT"
  val ScalaVersion = "2.11.6"
  val ScalatraVersion = "2.3.1"

  lazy val project = Project (
    "demo",
    file("."),
    settings = ScalatraPlugin.scalatraWithJRebel ++ scalateSettings ++ Seq(
      organization := Organization,
      name := Name,
      version := Version,
      scalaVersion := ScalaVersion,
      resolvers += Classpaths.typesafeReleases,
      libraryDependencies ++= Seq(
        "org.scalatra" %% "scalatra" % ScalatraVersion,
        "org.scalatra" %% "scalatra-scalate" % ScalatraVersion,
        "org.scalatra" %% "scalatra-specs2" % ScalatraVersion % "test",
        "org.scala-lang" %  "scala-reflect"  % scalaVersion.value,
        "org.eclipse.jetty" % "jetty-webapp" % "9.1.5.v20140505" % "container",
        "org.eclipse.jetty" % "jetty-plus" % "9.1.5.v20140505" % "container",
        "javax.servlet" % "javax.servlet-api" % "3.1.0",
        "org.scalikejdbc" %% "scalikejdbc" % "2.2.5",
        "org.scalikejdbc" %% "scalikejdbc-interpolation" % "2.2.5",
        "org.postgresql" % "postgresql" % "9.4-1200-jdbc41",
        "org.json4s" %% "json4s-jackson" % "3.2.11",
        "org.json4s" %% "json4s-native" % "3.2.11",
        "org.scalatra" %% "scalatra-json" % ScalatraVersion,
        "net.databinder.dispatch" %% "dispatch-core" % "0.11.2",
        "com.typesafe.akka" %% "akka-actor" % "2.3.4",
        "org.scala-lang.modules" %% "scala-xml" % "1.0.3"
      ),
      scalateTemplateConfig in Compile <<= (sourceDirectory in Compile){ base =>
        Seq(
          TemplateConfig(
            base / "webapp" / "WEB-INF" / "templates",
            Seq.empty,  /* default imports should be added here */
            Seq(
              Binding("context", "_root_.org.scalatra.scalate.ScalatraRenderContext", importMembers = true, isImplicit = true)
            ),  /* add extra bindings here */
            Some("templates")
          )
        )
      }
    )
  ).settings(net.virtualvoid.sbt.graph.Plugin.graphSettings: _*)
}


