//Solicita al usuario tres números enteros e indícale cuál es el menor//
import scala.io.StdIn

object num_menor{
    def main(args: Array[String]): Unit = {
        print("Dime tres números enteros: ")

        val a = StdIn.readInt()
        val b = StdIn.readInt()
        val c = StdIn.readInt()
        
        var menor = a 

        if (b < menor){
            menor = b
        }
        if (c<menor){
            menor = c
        }


        println("El número menor es :"+menor)
    }
}