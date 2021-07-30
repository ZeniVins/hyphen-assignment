provider "kubernetes" {
  config_path    = "~/.kube/config"
}

resource "kubernetes_pod" "mypod" {
  metadata {
    name = "mypod"
    labels = {
      app = "MyApp"
    }
  }
  spec {
    container {
      image = "linouche5/public-repo:latest"
      name  = "webserver"
    }
  }
}

resource "kubernetes_service" "myservice" {
  metadata {
    name = "myservice"
  }
  spec {
    selector = {
      app = kubernetes_pod.mypod.metadata.0.labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}