locals {
  suffix = "test07"
  data_disks = {
    0  = { size = 4, caching = "ReadOnly" },
    63 = { size = 2, caching = "None" },
  }
}
