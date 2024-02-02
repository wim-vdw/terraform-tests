resource "kubernetes_namespace" "tf-namespace" {
  metadata {
    name = "terraform-namespace"
  }
}

resource "kubernetes_deployment" "mydeployment" {
  metadata {
    name      = "mydep"
    namespace = kubernetes_namespace.tf-namespace.id
  }

  spec {
    replicas = "1"
    selector {
      match_labels = {
        app = "myapp"
      }
    }

    template {
      metadata {
        labels = {
          app = "myapp"
        }
      }

      spec {
        container {
          name  = "app"
          image = "wimvandenwyngaert/myalpine:1.0.2"
          command = [
            "/bin/sh",
            "-c",
            "sleep infinity"
          ]
        }
      }
    }
  }
}
