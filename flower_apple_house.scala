object BridgeBuilder {
  /**
    * A method to build a bridge spanning two points
    * @param startPoint The start point of the bridge
    * @param endPoint The end point of the bridge
    * @param materials The materials available for the bridge
    * @return A Bridge object
    */
  def buildBridge(startPoint: Point, endPoint: Point, materials: Array[Material]): Bridge = {
    val newBridge = Bridge(startPoint, endPoint, materials)
    newBridge.assembly()
    newBridge
  }

  case class Point(x: Double, y: Double, z: Double)

  abstract class Material {
    val name: String
    def strength: Double
    def cost: Double
    def mass: Double
  }

  class SteelMaterial extends Material {
    val name: String = "Steel"
    val strength: Double = 5000.0
    val cost: Double = 1000.0
    val mass: Double = 500.0
  }

  class WoodMaterial extends Material {
    val name: String = "Wood"
    val strength: Double = 500.0
    val cost: Double = 200.0
    val mass: Double = 100.0
  }

  class ConcreteMaterial extends Material {
    val name: String = "Concrete"
    val strength: Double = 1500.0
    val cost: Double = 400.0
    val mass: Double = 300.0
  }

  class Bridge(startPoint: Point, endPoint: Point, materials: Array[Material]) {
    val start = startPoint
    val end = endPoint
    val materialsUsed = materials

    private var assembled: Boolean = false

    def assembly(): Unit = {
      // Assemble the bridge
      assembled = true
    }

    def isAssembled(): Boolean = {
      assembled
    }
  }

}