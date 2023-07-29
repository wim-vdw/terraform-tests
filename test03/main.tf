resource "docker_image" "myalpine" {
  name = "myalpine"
  build {
    context = "./alpine"
  }
  triggers = {
    dir_sha1 = sha1(join("", [for f in fileset(path.module, "alpine/*") : filesha1(f)]))
  }
}

resource "docker_container" "myalpine" {
  name  = "myalpine"
  image = docker_image.myalpine.image_id
  rm    = true
}
