echo "dhrystone:"
for i in {1..13};
do
	echo $i
	./Config$i benchmarks/dhrystone.riscv
done

echo ""
echo "median:"
for i in {1..13};
do
	echo $i
	./Config$i benchmarks/median.riscv
done

echo ""
echo "multiply:"
for i in {1..13};
do
	echo $i
	./Config$i benchmarks/multiply.riscv
done

echo ""
echo "qsort:"
for i in {1..13};
do
	echo $i
	./Config$i benchmarks/qsort.riscv
done

echo ""
echo "rsort:"
for i in {1..13};
do
	echo $i
	./Config$i benchmarks/rsort.riscv
done

echo ""
echo "towers:"
for i in {1..13};
do
	echo $i
	./Config$i benchmarks/towers.riscv
done

echo ""
echo "vvadd:"
for i in {1..13};
do
	echo $i
	./Config$i benchmarks/vvadd.riscv
done

echo ""
echo "pmp, w/ vm v.s. w/o vm"
echo "8"
./Config14 benchmarks/pmp.riscv
echo "14"
./Config17 benchmarks/pmp.riscv

#echo ""
#echo "Config 17 one core"
#./Config17 benchmarks/mt-matmul.riscv
#echo "Config 19 two cores"
#./Config19 benchmarks/mt-matmul_2.riscv
#echo "Config 20 four cores"
#./Config20 benchmarks/mt-matmul_4.riscv
