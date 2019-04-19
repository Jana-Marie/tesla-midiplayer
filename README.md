# tesla midi player

./run splits a Midi file into its channels and sends two channels each to a connected Tesla coil. The mapping is done automatically depending on the connected midi tesla coils.
This project was created to control [Niklas pcbtc](https://github.com/NiklasFauth/pcbtc).

The kernel module for a virtual midi device must be loaded first and before a Tesla coil is connected.

`sudo modprobe snd-virmidi snd_index=1`

Afterwards a Midi file can be played with:

`./run <midi>`


##### dependencies

`midish aplaymidi`
