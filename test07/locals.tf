locals {
  suffix = "test07"
  data_disks = [
    {
      lun       = 0,
      size      = 4,
      caching   = "ReadOnly",
      disk_name = "disk-with-own-created-name",
    },
    {
      lun     = 63,
      size    = 2,
      caching = "None",
    },
  ]
}
