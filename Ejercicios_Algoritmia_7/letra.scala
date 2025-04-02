//Solicita al usuario una letra, si inserta una a muestra el número 7, si es una b, el 9, si es una c el 101 y si no es ninguno de los tres, indícale que se ha equivocado de letra//
import scala.io.StdIn

object letra{
    def main(args: Array[String]): Unit = {
        print("Dime una letra: ")
        val letra = StdIn.readLine()
        val a = "a"
        val b ="b"
        val c = "c"

        if(letra==a){
            println("7")
        }else if(letra==b){
            println("9")
        }else if(letra==c){
            println("101")
        }else {
            println("Te has equivocado de letra")
        }

    }
}