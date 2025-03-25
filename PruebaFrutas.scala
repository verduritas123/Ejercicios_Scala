import scala.collection.mutable.ArrayBuffer
import scala.io.StdIn

object PruebaFrutas{
    def main(args: Array[String]): Unit = {
        val frutasMutable = ArrayBuffer("Manzana", "Banana")
        println("Frutas actuales:" + frutasMutable.mkString(", "))

        print("Ingresa una nueva fruta: ")
        val nuevaFruta = StdIn.readLine()

        frutasMutable += nuevaFruta
        println("Frutas actualizadas: " + frutasMutable.mkString(", "))

        val ultimaFruta = frutasMutable.remove(frutasMutable.length -1)
        println("Última fruta eliminada: " +ultimaFruta)
        println ("Frutas finales: " + frutasMutable.mkString(", "))
    }
}