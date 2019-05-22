provider "openstack" {
  user_name = "${data.vault_generic_secret.openstack_credentials.data["user_name"]}"
  tenant_name       = "${var.project_name}"
  password     = "${data.vault_generic_secret.openstack_credentials.data["password"]}"
  auth_url   = "${data.vault_generic_secret.openstack_credentials.data["auth_url"]}"
  region   = "${data.vault_generic_secret.openstack_credentials.data["region"]}"
}

resource "openstack_compute_instance_v2" "instance" {
  name            = "${var.instance_name}"
  security_groups = ["${var.secgroup}"]

  network {
    name = "${var.netname}"
  }
}
