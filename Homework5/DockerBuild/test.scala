package freechips.rocketchip.system

import freechips.rocketchip.config.Config
import freechips.rocketchip.subsystem._
import freechips.rocketchip.config._
import freechips.rocketchip.rocket._
import freechips.rocketchip.tile._

// Config 1
// 1 core
// 16 entries Dcache, 1-way, random
// 16 entries Icache, 1-way
// no L2
// no VM, no TLB
class Config1 extends Config(
  // new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2, 
  //  nBanks = 1, nWays = 1) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(0) ++                            
  new WithNTestCores(n_core = 1, 
                     L1_Dcache_Set = 16, L1_Dcache_Way = 1,
                     L1_Icache_Set = 16, L1_Icache_Way = 1,
                     L1_Dcache_replacement = "random", // "lru", "plru"
                     L1_Dcache_TLB_Set = 1, L1_Dcache_TLB_Way = 4,
                     L1_Icache_TLB_Set = 1, L1_Icache_TLB_Way = 4,
                     L2_TLB_Set        = 0, L2_TLB_Way        = 4,
                     enable_vm = false
                     ) ++  
  new TestBaseConfig()
  )

// Config 2
// 1 core
// 16 entries Dcache, 2-way, random
// 16 entries Icache, 1-way
// no L2
// no VM, no TLB
class Config2 extends Config(
  // new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2, 
  //  nBanks = 1, nWays = 1) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(0) ++                            
  new WithNTestCores(n_core = 1, 
                     L1_Dcache_Set = 8,  L1_Dcache_Way = 2,
                     L1_Icache_Set = 16, L1_Icache_Way = 1,
                     L1_Dcache_replacement = "random", // "lru", "plru"
                     L1_Dcache_TLB_Set = 1, L1_Dcache_TLB_Way = 4,
                     L1_Icache_TLB_Set = 1, L1_Icache_TLB_Way = 4,
                     L2_TLB_Set        = 0, L2_TLB_Way        = 4,
                     enable_vm = false
                     ) ++  
  new TestBaseConfig()
  )

// Config 3
// 1 core
// 16 entries Dcache, 4-way, random
// 16 entries Icache, 1-way
// no L2
// no VM, no TLB
class Config3 extends Config(
  // new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2, 
  //  nBanks = 1, nWays = 1) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(0) ++                            
  new WithNTestCores(n_core = 1, 
                     L1_Dcache_Set = 4,  L1_Dcache_Way = 4,
                     L1_Icache_Set = 16, L1_Icache_Way = 1,
                     L1_Dcache_replacement = "random", // "lru", "plru"
                     L1_Dcache_TLB_Set = 1, L1_Dcache_TLB_Way = 4,
                     L1_Icache_TLB_Set = 1, L1_Icache_TLB_Way = 4,
                     L2_TLB_Set        = 0, L2_TLB_Way        = 4,
                     enable_vm = false
                     ) ++  
  new TestBaseConfig()
  )

// Config 4
// 1 core
// 16 entries Dcache, 4-way, lru
// 16 entries Icache, 1-way
// no L2
// no VM, no TLB
class Config4 extends Config(
  // new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2, 
  //  nBanks = 1, nWays = 1) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(0) ++                            
  new WithNTestCores(n_core = 1, 
                     L1_Dcache_Set = 4,  L1_Dcache_Way = 4,
                     L1_Icache_Set = 16, L1_Icache_Way = 1,
                     L1_Dcache_replacement = "lru", // "lru", "plru"
                     L1_Dcache_TLB_Set = 1, L1_Dcache_TLB_Way = 4,
                     L1_Icache_TLB_Set = 1, L1_Icache_TLB_Way = 4,
                     L2_TLB_Set        = 0, L2_TLB_Way        = 4,
                     enable_vm = false
                     ) ++  
  new TestBaseConfig()
  )

// Config 5
// 1 core
// 16 entries Dcache, 4-way, plru
// 16 entries Icache, 1-way
// no L2
// no VM, no TLB
class Config5 extends Config(
  // new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2, 
  //  nBanks = 1, nWays = 1) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(0) ++                            
  new WithNTestCores(n_core = 1, 
                     L1_Dcache_Set = 4, L1_Dcache_Way = 4,
                     L1_Icache_Set = 16, L1_Icache_Way = 1,
                     L1_Dcache_replacement = "plru", // "lru", "plru"
                     L1_Dcache_TLB_Set = 1, L1_Dcache_TLB_Way = 4,
                     L1_Icache_TLB_Set = 1, L1_Icache_TLB_Way = 4,
                     L2_TLB_Set        = 0, L2_TLB_Way        = 4,
                     enable_vm = false
                     ) ++  
  new TestBaseConfig()
  )

// Config 6
// 1 core
// 16 entries Dcache, 1-way, random
// 16 entries Icache, 2-way
// no L2
// no VM, no TLB
class Config6 extends Config(
  // new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2, 
  //  nBanks = 1, nWays = 1) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(0) ++                            
  new WithNTestCores(n_core = 1, 
                     L1_Dcache_Set = 16, L1_Dcache_Way = 1,
                     L1_Icache_Set = 8,  L1_Icache_Way = 2,
                     L1_Dcache_replacement = "random", // "lru", "plru"
                     L1_Dcache_TLB_Set = 1, L1_Dcache_TLB_Way = 4,
                     L1_Icache_TLB_Set = 1, L1_Icache_TLB_Way = 4,
                     L2_TLB_Set        = 0, L2_TLB_Way        = 4,
                     enable_vm = false
                     ) ++  
  new TestBaseConfig()
  )

// Config 7
// 1 core
// 16 entries Dcache, 1-way, random
// 16 entries Icache, 4-way
// no L2
// no VM, no TLB
class Config7 extends Config(
  // new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2, 
  //  nBanks = 1, nWays = 1) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(0) ++                            
  new WithNTestCores(n_core = 1, 
                     L1_Dcache_Set = 16, L1_Dcache_Way = 1,
                     L1_Icache_Set = 4,  L1_Icache_Way = 4,
                     L1_Dcache_replacement = "random", // "lru", "plru"
                     L1_Dcache_TLB_Set = 1, L1_Dcache_TLB_Way = 4,
                     L1_Icache_TLB_Set = 1, L1_Icache_TLB_Way = 4,
                     L2_TLB_Set        = 0, L2_TLB_Way        = 4,
                     enable_vm = false
                     ) ++  
  new TestBaseConfig()
  )

// Config 8
// 1 core
// 16 entries Dcache, 1-way, random
// 16 entries Icache, 1-way
// With L2: 256 entries, 1-bank, 2-way
// no VM, no TLB
class Config8 extends Config(
  new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2, 
    nBanks = 1, nWays = 2) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(0) ++                            
  new WithNTestCores(n_core = 1, 
                     L1_Dcache_Set = 16,  L1_Dcache_Way = 1,
                     L1_Icache_Set = 16,  L1_Icache_Way = 1,
                     L1_Dcache_replacement = "random", // "lru", "plru"
                     L1_Dcache_TLB_Set = 1, L1_Dcache_TLB_Way = 4,
                     L1_Icache_TLB_Set = 1, L1_Icache_TLB_Way = 4,
                     L2_TLB_Set        = 0, L2_TLB_Way        = 4,
                     enable_vm = false
                     ) ++  
  new TestBaseConfig()
  )

// Config 9
// 1 core
// 16 entries Dcache, 1-way, random
// 16 entries Icache, 1-way
// With L2: 256 entries, 2-bank, 2-way
// no VM, no TLB
class Config9 extends Config(
  new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2, 
    nBanks = 2, nWays = 2) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(0) ++                            
  new WithNTestCores(n_core = 1, 
                     L1_Dcache_Set = 16,  L1_Dcache_Way = 1,
                     L1_Icache_Set = 16,  L1_Icache_Way = 1,
                     L1_Dcache_replacement = "random", // "lru", "plru"
                     L1_Dcache_TLB_Set = 1, L1_Dcache_TLB_Way = 4,
                     L1_Icache_TLB_Set = 1, L1_Icache_TLB_Way = 4,
                     L2_TLB_Set        = 0, L2_TLB_Way        = 4,
                     enable_vm = false
                     ) ++  
  new TestBaseConfig()
  )

// Config 10
// 1 core
// 16 entries Dcache, 1-way, random
// 16 entries Icache, 1-way
// With L2: 256 entries, 4-bank, 2-way
// no VM, no TLB
class Config10 extends Config(
  new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2, 
    nBanks = 4, nWays = 2) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(0) ++                            
  new WithNTestCores(n_core = 1, 
                     L1_Dcache_Set = 16,  L1_Dcache_Way = 1,
                     L1_Icache_Set = 16,  L1_Icache_Way = 1,
                     L1_Dcache_replacement = "random", // "lru", "plru"
                     L1_Dcache_TLB_Set = 1, L1_Dcache_TLB_Way = 4,
                     L1_Icache_TLB_Set = 1, L1_Icache_TLB_Way = 4,
                     L2_TLB_Set        = 0, L2_TLB_Way        = 4,
                     enable_vm = false
                     ) ++  
  new TestBaseConfig()
  )

// Config 11
// 1 core
// 16 entries Dcache, 1-way, random
// 16 entries Icache, 1-way
// With L2: 256 entries, 4-bank, 4-way
// no VM, no TLB
class Config11 extends Config(
  new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2, 
    nBanks = 4, nWays = 4) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(0) ++                            
  new WithNTestCores(n_core = 1, 
                     L1_Dcache_Set = 16,  L1_Dcache_Way = 1,
                     L1_Icache_Set = 16,  L1_Icache_Way = 1,
                     L1_Dcache_replacement = "random", // "lru", "plru"
                     L1_Dcache_TLB_Set = 1, L1_Dcache_TLB_Way = 4,
                     L1_Icache_TLB_Set = 1, L1_Icache_TLB_Way = 4,
                     L2_TLB_Set        = 0, L2_TLB_Way        = 4,
                     enable_vm = false
                     ) ++  
  new TestBaseConfig()
  )

// Config 12
// 1 core
// 16 entries Dcache, 4-way, random
// 16 entries Icache, 1-way
// With L2: 256 entries, 1-bank, 4-way
// no VM, no TLB
class Config12 extends Config(
  new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2, 
    nBanks = 1, nWays = 4) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(0) ++                            
  new WithNTestCores(n_core = 1, 
                     L1_Dcache_Set = 4,   L1_Dcache_Way = 4,
                     L1_Icache_Set = 16,  L1_Icache_Way = 1,
                     L1_Dcache_replacement = "random", // "lru", "plru"
                     L1_Dcache_TLB_Set = 1, L1_Dcache_TLB_Way = 4,
                     L1_Icache_TLB_Set = 1, L1_Icache_TLB_Way = 4,
                     L2_TLB_Set        = 0, L2_TLB_Way        = 4,
                     enable_vm = false
                     ) ++  
  new TestBaseConfig()
  )

// Config 13
// 1 core
// 16 entries Dcache, 4-way, random
// 16 entries Icache, 1-way
// With L2: 256 entries, 4-bank, 4-way
// no VM, no TLB
class Config13 extends Config(
  new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2,
    nBanks = 4, nWays = 4) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(0) ++                            
  new WithNTestCores(n_core = 1, 
                     L1_Dcache_Set = 4,   L1_Dcache_Way = 4,
                     L1_Icache_Set = 16,  L1_Icache_Way = 1,
                     L1_Dcache_replacement = "random", // "lru", "plru"
                     L1_Dcache_TLB_Set = 1, L1_Dcache_TLB_Way = 4,
                     L1_Icache_TLB_Set = 1, L1_Icache_TLB_Way = 4,
                     L2_TLB_Set        = 0, L2_TLB_Way        = 4,
                     enable_vm = false
                     ) ++  
  new TestBaseConfig()
  )

// Config 14
// 1 core
// 16 entries Dcache, 1-way, random
// 16 entries Icache, 1-way
// With L2: 256 entries, 1-bank, 2-way
// With VM, L1 Dcache TLB: 16 entries, 4-way
//          L1 Icache TLB: 16 entries, 4-way
//          No L2 TLB
class Config14 extends Config(
  new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2,
    nBanks = 1, nWays = 2) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(0) ++                            
  new WithNTestCores(n_core = 1, 
                     L1_Dcache_Set = 16,  L1_Dcache_Way = 1,
                     L1_Icache_Set = 16,  L1_Icache_Way = 1,
                     L1_Dcache_replacement = "random", // "lru", "plru"
                     L1_Dcache_TLB_Set = 4, L1_Dcache_TLB_Way = 4,
                     L1_Icache_TLB_Set = 4, L1_Icache_TLB_Way = 4,
                     L2_TLB_Set        = 0, L2_TLB_Way        = 4,
                     enable_vm = true
                     ) ++  
  new TestBaseConfig()
  )

// Config 15
// 1 core
// 16 entries Dcache, 1-way, random
// 16 entries Icache, 1-way
// With L2: 256 entries, 1-bank, 2-way
// With VM, L1 Dcache TLB: 16 entries, 8-way
//          L1 Icache TLB: 16 entries, 8-way
//          No L2 TLB
class Config15 extends Config(
  new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2,
    nBanks = 1, nWays = 2) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(0) ++                            
  new WithNTestCores(n_core = 1, 
                     L1_Dcache_Set = 16,  L1_Dcache_Way = 1,
                     L1_Icache_Set = 16,  L1_Icache_Way = 1,
                     L1_Dcache_replacement = "random", // "lru", "plru"
                     L1_Dcache_TLB_Set = 2, L1_Dcache_TLB_Way = 8,
                     L1_Icache_TLB_Set = 2, L1_Icache_TLB_Way = 8,
                     L2_TLB_Set        = 0, L2_TLB_Way        = 4,
                     enable_vm = true
                     ) ++  
  new TestBaseConfig()
  )

// Config 16
// 1 core
// 16 entries Dcache, 1-way, random
// 16 entries Icache, 1-way
// With L2: 256 entries, 1-bank, 2-way
// With VM, L1 Dcache TLB: 16 entries, 16-way
//          L1 Icache TLB: 16 entries, 16-way
//          No L2 TLB
class Config16 extends Config(
  new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2,
    nBanks = 1, nWays = 2) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(0) ++                            
  new WithNTestCores(n_core = 1, 
                     L1_Dcache_Set = 16,  L1_Dcache_Way = 1,
                     L1_Icache_Set = 16,  L1_Icache_Way = 1,
                     L1_Dcache_replacement = "random", // "lru", "plru"
                     L1_Dcache_TLB_Set = 1, L1_Dcache_TLB_Way = 16,
                     L1_Icache_TLB_Set = 1, L1_Icache_TLB_Way = 16,
                     L2_TLB_Set        = 0, L2_TLB_Way        = 4,
                     enable_vm = true
                     ) ++  
  new TestBaseConfig()
  )

// Config 17
// 1 core
// 16 entries Dcache, 1-way, random
// 16 entries Icache, 1-way
// With L2: 256 entries, 1-bank, 2-way
// With VM, L1 Dcache TLB: 16 entries, 4-way
//          L1 Icache TLB: 16 entries, 4-way
//          L2 TLB: 64 entries, 4-way
class Config17 extends Config(
  new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2,
    nBanks = 1, nWays = 2) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(16*4) ++                            
  new WithNTestCores(n_core = 1, 
                     L1_Dcache_Set = 16,  L1_Dcache_Way = 1,
                     L1_Icache_Set = 16,  L1_Icache_Way = 1,
                     L1_Dcache_replacement = "random", // "lru", "plru"
                     L1_Dcache_TLB_Set = 4,  L1_Dcache_TLB_Way = 4,
                     L1_Icache_TLB_Set = 4,  L1_Icache_TLB_Way = 4,
                     L2_TLB_Set        = 16, L2_TLB_Way        = 4,
                     enable_vm = true
                     ) ++  
  new TestBaseConfig()
  )

// Config 18
// 1 core
// 16 entries Dcache, 1-way, random
// 16 entries Icache, 1-way
// With L2: 256 entries, 1-bank, 2-way
// With VM, L1 Dcache TLB: 16 entries, 4-way
//          L1 Icache TLB: 16 entries, 4-way
//          L2 TLB: 64 entries, 8-way
class Config18 extends Config(
  new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2,
    nBanks = 1, nWays = 2) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(8*8) ++                            
  new WithNTestCores(n_core = 1, 
                     L1_Dcache_Set = 16,  L1_Dcache_Way = 1,
                     L1_Icache_Set = 16,  L1_Icache_Way = 1,
                     L1_Dcache_replacement = "random", // "lru", "plru"
                     L1_Dcache_TLB_Set = 4,  L1_Dcache_TLB_Way = 4,
                     L1_Icache_TLB_Set = 4,  L1_Icache_TLB_Way = 4,
                     L2_TLB_Set        = 8,  L2_TLB_Way        = 8,
                     enable_vm = true
                     ) ++  
  new TestBaseConfig()
  )

// Config 19
// 2 core
// 16 entries Dcache, 1-way, random
// 16 entries Icache, 1-way
// With L2: 256 entries, 1-bank, 2-way
// With VM, L1 Dcache TLB: 16 entries, 4-way
//          L1 Icache TLB: 16 entries, 4-way
//          L2 TLB: 64 entries, 4-way
class Config19 extends Config(
  new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2,
    nBanks = 1, nWays = 2) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(16*4) ++                            
  new WithNTestCores(n_core = 2, 
                     L1_Dcache_Set = 16,  L1_Dcache_Way = 1,
                     L1_Icache_Set = 16,  L1_Icache_Way = 1,
                     L1_Dcache_replacement = "random", // "lru", "plru"
                     L1_Dcache_TLB_Set = 4,  L1_Dcache_TLB_Way = 4,
                     L1_Icache_TLB_Set = 4,  L1_Icache_TLB_Way = 4,
                     L2_TLB_Set        = 16, L2_TLB_Way        = 4,
                     enable_vm = true
                     ) ++  
  new TestBaseConfig()
  )

// Config 20
// 4 core
// 16 entries Dcache, 1-way, random
// 16 entries Icache, 1-way
// With L2: 256 entries, 1-bank, 2-way
// With VM, L1 Dcache TLB: 16 entries, 4-way
//          L1 Icache TLB: 16 entries, 4-way
//          L2 TLB: 64 entries, 4-way
class Config20 extends Config(
  new freechips.rocketchip.subsystem.WithInclusiveCache(outerLatencyCycles = 40, capacityKB = 2,
    nBanks = 1, nWays = 2) ++  // L2 Cache
  new chipyard.config.WithL2TLBs(16*4) ++                            
  new WithNTestCores(n_core = 4, 
                     L1_Dcache_Set = 16,  L1_Dcache_Way = 1,
                     L1_Icache_Set = 16,  L1_Icache_Way = 1,
                     L1_Dcache_replacement = "random", // "lru", "plru"
                     L1_Dcache_TLB_Set = 4,  L1_Dcache_TLB_Way = 4,
                     L1_Icache_TLB_Set = 4,  L1_Icache_TLB_Way = 4,
                     L2_TLB_Set        = 16, L2_TLB_Way        = 4,
                     enable_vm = true
                     ) ++  
  new TestBaseConfig()
  )

class WithNTestCores(n_core: Int, 
  L1_Dcache_Set:            Int, L1_Dcache_Way:     Int,
  L1_Icache_Set:            Int, L1_Icache_Way:     Int, 
  L1_Dcache_replacement: String,
  L1_Dcache_TLB_Set:        Int, L1_Dcache_TLB_Way: Int,
  L1_Icache_TLB_Set:        Int, L1_Icache_TLB_Way: Int,
  L2_TLB_Set:               Int, L2_TLB_Way:        Int,
  enable_vm:            Boolean,
  overrideIdOffset: Option[Int] = None) extends Config((site, here, up) => {
  case RocketTilesKey => {
    val prev = up(RocketTilesKey, site)
    val idOffset = overrideIdOffset.getOrElse(prev.size)
    val med = RocketTileParams(
      core = RocketCoreParams(
        fpu           = None, 
        useVM         = enable_vm,
        nL2TLBEntries = L2_TLB_Way*L2_TLB_Set,                      
        nL2TLBWays    = L2_TLB_Way                      
      ),
      btb = None,
      dcache = Some(DCacheParams(
        rowBits           = site(SystemBusKey).beatBits,
        nSets             = L1_Dcache_Set,                       
        nWays             = L1_Dcache_Way,                       
        nTLBSets          = L1_Dcache_TLB_Set,                           
        nTLBWays          = L1_Dcache_TLB_Way,                           
        replacementPolicy = L1_Dcache_replacement,      
        nMSHRs            = 0,
        blockBytes        = site(CacheBlockBytes))
      ),
      icache = Some(ICacheParams(
        rowBits    = site(SystemBusKey).beatBits,
        nSets      = L1_Icache_Set,                       
        nWays      = L1_Icache_Way,        
        nTLBSets   = L1_Icache_TLB_Set,                        
        nTLBWays   = L1_Icache_TLB_Way,                       
        blockBytes = site(CacheBlockBytes))
      )
    )
    List.tabulate(n_core)(i => med.copy(hartId = i + idOffset)) ++ prev
  }
})

class TestBaseConfig extends Config(
  // new freechips.rocketchip.subsystem.WithJtagDTM ++
  new freechips.rocketchip.subsystem.WithExtMemSize((1<<30) * 1L) ++   
  new freechips.rocketchip.subsystem.WithCoherentBusTopology ++ 
  new WithDefaultMemPort() ++
  new WithDefaultMMIOPort() ++
  new WithDefaultSlavePort() ++
  new WithTimebase(BigInt(1000000)) ++ // 1 MHz
  new WithDTS("freechips,rocketchip-unknown", Nil) ++
  new WithNExtTopInterrupts(0) ++
  new BaseSubsystemConfig()
)

