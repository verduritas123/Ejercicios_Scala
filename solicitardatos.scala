import scala.collection.mutable.ArrayBuffer
import scala.io.StdIn

object SolicitarDatos{
    def main(args: Array[String]): Unit = {
        val datos = ArrayBuffer("Tus datos son ( nombre, apellidos, email y direccion):")
        println("Voy a solicitar tus datos( nombre, apellidos, email y dirección)")

        print("Ingresa tu nombre: ")
        val nombre = StdIn.readLine()

        print("Ingresa tus apellidos: ")
        val apellidos = StdIn.readLine()

        print("Ingresa tu email: ")
        val email = StdIn.readLine()

        print("Ingresa tu dirección: ")
        val direccion = StdIn.readLine()

        datos += nombre  
        datos +=apellidos  
        datos +=email 
        datos +=direccion
        println(datos.mkString(","))


    }
}