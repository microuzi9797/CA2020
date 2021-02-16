echo "$1"
echo "Config1"
spike --ic=16:1:64 --dc=16:1:64 ./benchmarks/$1.riscv
echo "Config2"
spike --ic=16:1:64 --dc=8:2:64 ./benchmarks/$1.riscv
echo "Config3"
spike --ic=16:1:64 --dc=4:4:64 ./benchmarks/$1.riscv
echo "Config6"
spike --ic=8:2:64 --dc=16:1:64 ./benchmarks/$1.riscv
echo "Config7"
spike --ic=4:4:64 --dc=16:1:64 ./benchmarks/$1.riscv
echo "Config8"
spike --ic=16:1:64 --dc=16:1:64 --l2=128:2:64 ./benchmarks/$1.riscv
echo "Config12"
spike --ic=16:1:64 --dc=4:4:64 --l2=64:4:64 ./benchmarks/$1.riscv
