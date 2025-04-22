name := "MongoDBInsercion"

version := "1.0"

scalaVersion := "2.13.12"

libraryDependencies ++= Seq(
  "org.mongodb.scala" %% "mongo-scala-driver" % "4.11.0",
  "io.circe" %% "circe-core" % "0.14.5",
  "io.circe" %% "circe-parser" % "0.14.5",
  "io.circe" %% "circe-generic" % "0.14.5"
)
