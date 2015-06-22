import _root_.akka.actor.{ActorSystem, Props}
import com.thebhwgroup.app._
import org.scalatra._
import javax.servlet.ServletContext

class ScalatraBootstrap extends LifeCycle {
  // Get a handle to an ActorSystem and a reference to one of your actors
  val system = ActorSystem()

  override def init(context: ServletContext) {
    context.mount(new DemoServlet(system), "/*")
  }

  // Make sure you shut down
  override def destroy(context:ServletContext) {
    system.shutdown()
  }
}
