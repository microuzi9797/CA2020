package chipyard.config

import freechips.rocketchip.config.{Field, Parameters, Config}
import freechips.rocketchip.subsystem.{SystemBusKey, RocketTilesKey, WithRoccExample, WithNMemoryChannels, WithNBigCores, WithRV32, CacheBlockBytes}
import freechips.rocketchip.diplomacy.{LazyModule, ValName}
import freechips.rocketchip.devices.tilelink.BootROMParams
import freechips.rocketchip.devices.debug.{Debug}
import freechips.rocketchip.tile.{XLen, BuildRoCC, TileKey, LazyRoCC, RocketTileParams, MaxHartIdBits}
import freechips.rocketchip.rocket.{RocketCoreParams, MulDivParams, DCacheParams, ICacheParams}
import freechips.rocketchip.util.{AsyncResetReg}

class WithL2TLBs(entries: Int) extends Config((site, here, up) => {
  case RocketTilesKey => up(RocketTilesKey) map (tile => tile.copy(
    core = tile.core.copy(nL2TLBEntries = entries)
  ))
})
