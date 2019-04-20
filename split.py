import midi
import sys

midifile = sys.argv[1]
midi_in = midi.read_midifile(midifile)

tracks = str(sys.argv[2]).split(":")
tracks = tracks[:int(sys.argv[3])]
deviceIndex = (sys.argv[4],sys.argv[5],sys.argv[6])

idx = 0
for x in xrange(0, len(tracks), 2):
    midi_out = midi.Pattern()
    midi_out.append(midi_in[int(tracks[x])-1])
    midi_out.append(midi_in[int(tracks[x+1])-1])
    midi.write_midifile("out{0}.mid".format(idx), midi_out)
    print "aplaymidi -p {0}:0 out{1}.mid &".format(deviceIndex[idx],idx)
    idx += 1
