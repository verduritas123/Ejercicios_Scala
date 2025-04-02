//Solicita al usuario una frase y una letra y muestra la cantidad de veces que aparece la letra en la frase.

//

import scala.io.StdIn

object frase{
    def main(args: Array[String]): Unit = {
        print("Dime una frase: ")
        val frase = StdIn.readLine()

        print("Dime una letra: ")
        val letra = StdIn.readChar()

        var contador = 0
       
        for (i <- frase) {
            if (i==letra)
                contador  += 1
    }


        println(s"El número de veces que '$frase' contiene la letra '$letra' es $contador")
    }
}