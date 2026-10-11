resource "helm_release" "this" {
  create_namespace = true
  name = "testing"

  chart      = "./basic-chart"
  namespace  = "testing"
  version    = "0.1.0"

  values     = [yamlencode({
    "config" = {
      "my_cool_config" = [
        {
          "x": 1,
          "y": 2
        }
      ]
    }})]

  set_wo = [{
    name  = "config.my_cool_config[0].x"
    value = 3
  }]

  set_wo_revision = 1
}
