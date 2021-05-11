cluster_name = "cresset-flare"
project      = "tactical-hope-313419"
zone         = "us-central1-b"

# network_name            = "<existing network name>"
# subnetwork_name         = "<existing subnetwork name>"
# shared_vpc_host_project = "<vpc host project>"
 
  disable_controller_public_ips = false
# disable_login_public_ips      = true
# disable_compute_public_ips    = true

  suspend_time  = 300

controller_machine_type = "n1-standard-2"
controller_image        = "projects/schedmd-slurm-public/global/images/family/schedmd-slurm-20-11-4-hpc-centos-7"
controller_disk_type    = "pd-standard"
controller_disk_size_gb = 50
 controller_labels = {
   deployment_manager = "terraform"
   cluster_type = "slurm"
   node_type = "controller"
 }
# controller_service_account = "default"
# controller_scopes          = ["https://www.googleapis.com/auth/cloud-platform"]
# cloudsql = {
#   server_ip = "<cloudsql ip>"
#   user      = "slurm"
#   password  = "verysecure"
#   db_name   = "slurm_accounting"
# }
# controller_secondary_disk      = false
# controller_secondary_disk_size = 100
# controller_secondary_disk_type = "pd-ssd"
#
# When specifying an instance template, specified controller fields will
# override the template properites.
# controller_instance_template = null

login_machine_type = "n1-standard-2"
login_image        = "projects/schedmd-slurm-public/global/images/family/schedmd-slurm-20-11-4-hpc-centos-7"
login_disk_type    = "pd-standard"
login_disk_size_gb = 20
 login_labels = {
   deployment_manager = "terraform"
   cluster_type = "slurm"
   node_type = "login"
 }
 
  login_node_count = 0
# login_node_service_account = "default"
# login_node_scopes          = [
#   "https://www.googleapis.com/auth/monitoring.write",
#   "https://www.googleapis.com/auth/logging.write"
# ]
#
# When specifying an instance template, specified login fields will
# override the template properites.
# login_instance_template = null

# Optional network storage fields
# network_storage is mounted on all instances
# login_network_storage is mounted on controller and login instances
# network_storage = [{
#   server_ip     = "<storage host>"
#   remote_mount  = "/home"
#   local_mount   = "/home"
#   fs_type       = "nfs"
#   mount_options = null
# }]
#
# login_network_storage = [{
#   server_ip     = "<storage host>"
#   remote_mount  = "/net_storage"
#   local_mount   = "/shared"
#   fs_type       = "nfs"
#   mount_options = null
# }]

# compute_node_service_account = "default"
# compute_node_scopes          = [
#   "https://www.googleapis.com/auth/monitoring.write",
#   "https://www.googleapis.com/auth/logging.write"
# ]

partitions = [
  { name                 = "cpu.p"
    machine_type         = "n1-standard-4"
    static_node_count    = 0
    max_node_count       = 64
    zone                 = "us-central1-b"
    compute_disk_type    = "pd-standard"
    compute_disk_size_gb = 20
    compute_labels       = {
      accelerator = "gpu"
      deployment_manager = "terraform"
      cluster_type = "slurm"
      node_type = "compute"
    }
    cpu_platform         = null
    gpu_count            = 0
    gpu_type             = null
    network_storage      = []
#    network_storage      = [{
#      server_ip     = "none"
#      remote_mount  = "<gcs bucket name>"
#      local_mount   = "/data"
#      fs_type       = "gcsfuse"
#      mount_options = "file_mode=664,dir_mode=775,allow_other"
#    }]
    preemptible_bursting = true
    vpc_subnet           = null
    enable_placement     = false
    regional_capacity    = false
    regional_policy      = {}
    instance_template    = null
    exclusive            = false
    image                = "projects/schedmd-slurm-public/global/images/family/schedmd-slurm-20-11-4-hpc-centos-7"
    image_hyperthreads   = false
  },
  { name                 = "gpu.p"
    machine_type         = "n1-standard-2"
    static_node_count    = 0
    max_node_count       = 64
    zone                 = "us-central1-b"
    compute_disk_type    = "pd-standard"
    compute_disk_size_gb = 20
    compute_labels       = {
      accelerator = "gpu"
      deployment_manager = "terraform"
      cluster_type = "slurm"
      node_type = "compute"
    }
    cpu_platform         = null
    gpu_count            = 1
    gpu_type             = "nvidia-tesla-t4"
    network_storage      = []
#    network_storage      = [{
#      server_ip     = "none"
#      remote_mount  = "<gcs bucket name>"
#      local_mount   = "/data"
#      fs_type       = "gcsfuse"
#      mount_options = "file_mode=664,dir_mode=775,allow_other"
#    }]
     preemptible_bursting = true
     vpc_subnet           = null
     enable_placement     = false
    regional_capacity    = false
    regional_policy      = {}
    instance_template    = null
    exclusive            = false
    image                = "projects/schedmd-slurm-public/global/images/family/schedmd-slurm-20-11-4-hpc-centos-7"
    image_hyperthreads   = false
}]
