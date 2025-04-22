import org.mongodb.scala._
import org.mongodb.scala.bson.collection.immutable.Document
import com.mongodb.client.result.InsertOneResult 

import io.circe._, io.circe.parser._
import io.circe.generic.auto._

import scala.io.Source
import scala.io.StdIn.readLine

// Modelos
case class Autor(nombre: String, nacionalidad: String, edad: Int)
case class Libro(titulo: String, isbn: String, autor: String)
case class Datos(autores: List[Autor], libros: List[Libro])

object MongoDBInsercion extends App {

  // Conexión a MongoDB
  val client: MongoClient = MongoClient("mongodb://localhost:27017")
  val db: MongoDatabase = client.getDatabase("Biblioteca")
  val coleccionLibros: MongoCollection[Document] = db.getCollection("Libros")

  // Insertar libro
  def insertarLibro(libro: Libro): Unit = {
    val doc = Document(
      "titulo" -> libro.titulo,
      "isbn" -> libro.isbn,
      "autor" -> libro.autor
    )
    coleccionLibros.insertOne(doc).subscribe(new Observer[InsertOneResult] {
      override def onNext(result: InsertOneResult): Unit = println(s"Libro insertado: ${libro.titulo}")
      override def onError(e: Throwable): Unit = println(s"Error insertando libro: $e")
      override def onComplete(): Unit = {}
    })
  }

  // Insertar autor (colección separada)
  def insertarAutor(autor: Autor): Unit = {
    val doc = Document(
      "nombre" -> autor.nombre,
      "nacionalidad" -> autor.nacionalidad,
      "edad" -> autor.edad
    )
    db.getCollection("Autores").insertOne(doc).subscribe(new Observer[InsertOneResult] {
      override def onNext(result: InsertOneResult): Unit = println(s"Autor insertado: ${autor.nombre}")
      override def onError(e: Throwable): Unit = println(s"Error insertando autor: $e")
      override def onComplete(): Unit = {}
    })
  }

  // Opción 1: Insertar por teclado
  def insertarPorTeclado(): Unit = {
    println("Título del libro:")
    val titulo = readLine()
    println("ISBN del libro:")
    val isbn = readLine()
    println("Nombre del autor:")
    val autor = readLine()

    insertarLibro(Libro(titulo, isbn, autor))
  }

  // Opción 2: Insertar desde fichero JSON simple
  def insertarDesdeFicheroSimple(libroPath: String): Unit = {
    val libroJson = Source.fromFile(libroPath).mkString
    decode[Libro](libroJson).foreach(insertarLibro)
  }

  // Opción 3: Insertar desde fichero JSON conjunto
  def insertarDesdeFicheroConjunto(path: String): Unit = {
    val json = Source.fromFile(path).mkString
    decode[Datos](json) match {
      case Right(data) =>
        data.autores.foreach(insertarAutor)
        data.libros.foreach(insertarLibro)
      case Left(error) =>
        println(s"Error al leer JSON: $error")
    }
  }

  // Menú
  println(
    """Selecciona una opción:
      |1. Insertar libro por teclado
      |2. Insertar libro desde fichero JSON
      |3. Insertar autores y libros desde JSON conjunto
      |""".stripMargin)

  readLine() match {
    case "1" => insertarPorTeclado()
    case "2" =>
      println("Ruta del fichero JSON del libro:")
      val libroPath = readLine()
      insertarDesdeFicheroSimple(libroPath)
    case "3" =>
      println("Ruta del fichero JSON conjunto:")
      val path = readLine()
      insertarDesdeFicheroConjunto(path)
    case _ => println("Opción no válida")
  }

  Thread.sleep(2000)
  client.close()
}
