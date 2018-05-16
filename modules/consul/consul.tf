resource "consul_key_prefix" "config" {
  path_prefix = "condi.me/config/"

  subkeys = {
    "foo" = "bar"
  }
}
