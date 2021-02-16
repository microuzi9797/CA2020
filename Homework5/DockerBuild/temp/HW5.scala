package freechips.rocketchip.system

import freechips.rocketchip.config._

class HW5Config extends Config(
  // new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 4, // disabled
  //  nBanks = 4, nWays = 2) ++                                     // disabled
  // new chipyard.config.WithL2TLBs(0) ++                           // disabled
  new WithNTestCores(n_core = 4,                                    // fixed
                     L1_Dcache_Set = 16,  L1_Dcache_Way = 1,        // Can be modified: 16 entries
                     L1_Icache_Set = 16,  L1_Icache_Way = 1,        // Can be modified: 16 entries
                     L1_Dcache_replacement = "random",              // Can be modified: "random", "lru", "plru"
                     L1_Dcache_TLB_Set = 1,  L1_Dcache_TLB_Way = 4, // disabled
                     L1_Icache_TLB_Set = 1,  L1_Icache_TLB_Way = 4, // disabled
                     L2_TLB_Set        = 0, L2_TLB_Way         = 4, // disabled
                     enable_vm = false                              // disabled
                     ) ++
  new freechips.rocketchip.system.TestBaseConfig()
  )
