resource "kubernetes_namespace" "tf-namespace" {
  metadata {
    name = "terraform-tests"
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

resource "kubernetes_config_map" "myconfig" {
  metadata {
    name      = "my-config"
    namespace = kubernetes_namespace.tf-namespace.id
  }

  data = {
    env           = "development"
    type          = "application"
    num_processes = 3
  }
}

resource "kubernetes_secret" "secret" {
  metadata {
    name      = "secret"
    namespace = kubernetes_namespace.tf-namespace.id
  }

  data = {
    username = "admin"
    password = "P4ssw0rd"
  }
}
