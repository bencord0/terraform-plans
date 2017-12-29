resource "matchbox_group" "default" {
  name = "default"
  profile = "${matchbox_profile.default.name}"

}

resource "matchbox_group" "kube1" {
  name = "kube1"
  profile = "${matchbox_profile.installed.name}"
  selector {
    mac = "00:0d:b9:41:d4:30"
  }
}

resource "matchbox_group" "kube2" {
  name = "kube2"
  profile = "${matchbox_profile.installed.name}"
  selector {
    mac = "00:0d:b9:41:d6:d8"
  }
}

resource "matchbox_group" "kube3" {
  name = "kube3"
  profile = "${matchbox_profile.installed.name}"
  selector {
    mac = "00:0d:b9:41:db:54"
  }
}

resource "matchbox_group" "kube4" {
  name = "kube4"
  profile = "${matchbox_profile.installed.name}"
  selector {
    mac = "00:0d:b9:41:d3:f0"
  }
}
