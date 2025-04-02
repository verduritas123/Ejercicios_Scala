//Almacena en dos variables datos de validación (usuario y contraseña) correctos y permite que el usuario valide (dispone de 3 intentos)

import scala.io.StdIn

object validacion{
    def main(args: Array[String]): Unit = {
       val usuario= "pelot"
       val con= "pez"

        for (i<-1 to 3){
            println("Dime tu usuario y contraseña")
            val user = StdIn.readLine()
            val pass = StdIn.readLine()
            if(user == usuario && pass == con){
                println("Has sido validado")
                return
            }else{println("Usuario o contraseña incorrectos, inténtelo de nuevo")
            }
        }
            
        println("Demasiados intentos, inténtalo más tarde")
    }
}