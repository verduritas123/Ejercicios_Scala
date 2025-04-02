//Suma o resta (según elija el usuario) dos números reales

import scala.io.StdIn

object suma_resta{
    def main(args: Array[String]): Unit = {
        print("Dime dos números reales: ")
        val a = StdIn.readInt()
        val b = StdIn.readInt()
        var sumar = "sumar"
        var restar = "restar"
        var resultado=0

        print("Dime si quieres sumar o restar: ")
        val operacion = StdIn.readLine()

        if (operacion == sumar){
            resultado=a+b
        } 
            else if(operacion==restar){
                resultado=a-b
            }
            else{
                println("La operación no es valida")
            }
        

        println(s"El resultado de la operación $operacion de $a y $b es: $resultado")
    }
}