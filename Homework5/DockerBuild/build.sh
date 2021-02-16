for i in $(seq 1 1 20);
do
	make -j8 CONFIG=freechips.rocketchip.system.Config$i
	mv generated-src generated-src_Config$i
	mv emulator-freechips.rocketchip.system-freechips.rocketchip.system.Config$i Config$i
done
