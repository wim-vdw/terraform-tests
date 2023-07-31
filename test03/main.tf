resource "docker_image" "mynginx" {
  name         = "mynginx"
  keep_locally = false
  build {
    context = "./nginx"
  }
  triggers = {
    dir_sha1 = sha1(join("", [for f in fileset(path.module, "nginx/*") : filesha1(f)]))
  }
}

resource "docker_container" "mynginx" {
  name  = "mynginx"
  image = docker_image.mynginx.image_id
  rm    = true
  ports {
    internal = 80
    external = 80
  }
}
