#xcorrsound-test-files

Test Files for correctness testing and SCAPE benchmarking of xcorrSound waveform-compare tool.

The SCAPE xcorrSound tool set can be found here https://github.com/openplanets/scape-xcorrsound

The xcorrSound waveform-compare tool assumes correct wave files as input. When we use the tool in
SCAPE audio migration quality assurance, the correct wave files are assured by a JHove2 file format
validation. The SCAPE audio migration quality assurance workflow also includes an FFprobe property
extraction and comparison. The comparison workflow can be found on myExperiment
http://www.myexperiment.org/workflows/3521.html
The workflow requires the involved tools to be installed locally.

This workflow is also part of the Github repository https://github.com/statsbiblioteket/scape-audio-qa
which further includes scripts to set up the paths to the installed tools, and to run the workflow.

This project includes a script to run waveform-compare with the default settings on all the test files.

##Description of Data Set

| Test file | Comparison | Annotation	| Similar |
|:---|:---|:---|:---|
| challenge-KFC-2.wav | challenge.wav | One channel shifted a little less than 0.1 second; cut to original length and header updated to correct length | false |
| challenge-pmd.wav | challenge.wav | hidden jpg image in the least significant bits in the wave file using Mathematica; not audible to the human ear | true??? |
| challenge-TEG-1.wav | challenge.wav | File with random bits, same length as original | false |
| challenge-KFC.wav | challenge.wav | One channel shifted a little less than 0.1 second | false |
| challenge-TE-1.wav | challenge.wav | Audacity Amplify 0.1; not audible | true |
| challenge-TEG-2.wav | challenge.wav | File of double length, song repeated | false |
| challenge-KTC.wav | challenge.wav | normalize 0dB channel0; normalize -16dB channel1 | false |
| challenge-TE-2.wav | challenge.wav | Audacity Compressor 10:1 + amplify -5; similar to radio broadcast quality loss | false??? |
| challenge-TEG-3.wav | challenge.wav | Metadata changed (author) | false |
| challenge-TE-3.wav | challenge.wav | Audacity Vocal remover + amplify 5 | false |
| challenge-TEG-4.wav | challenge.wav | Echo effect in the beginning | false |
| Challenge-nbr-1.wav | challenge.wav | LAoE major changes in sound | false |
| challenge-TE-4.wav | challenge.wav | Audacity WahWah | false |
| challenge-TEG-5.wav | challenge.wav | Corrupt Wave-header | false |
| Challenge-nbr-2.wav | challenge.wav | LAoE major changes in sound | false |
| challenge-TE-5.wav | challenge.wav | Audacity AM Pitch Shifter 2 | false |
| challenge-UKH.wav | challenge.wav | hex editor edit values beginning and end of file (hidden messages); audible as short scratches (milliseconds) | false |
| Challenge-nbr-3.wav | challenge.wav | LAoE major changes in sound | false |
| challenge-TE-6.wav | challenge.wav | Audacity Echo 1 second | false |
| challenge.wav | challenge.wav | Exact match | true |
| challenge-nbr-7.wav | challenge.wav | Free Audio Server minor not audible silence | false |
| challenge-TE-7.wav | challenge.wav | Audacity change pitch to A  | false |
| challenge-KFC-3.wav | challenge.wav | One channel shifted a little less than 0.1 second; cut to original length and both file and stream header updated to correct length | true* |

Note the classification of files into similar and not similar is debatable. The difference in challenge-pmd.wav
and challenge.wav is not audible to the human ear, and is only discovered by the waveform-compare tool if the
match threshold is set to at least 0.9999994 (the default is 0.98). I think however that there is a general feeling
that we should 'catch' hidden images! The difference between challenge-TE-1.wav
and challenge.wav is also not audible, and only discoverable with threshold>=0.99993, and we think they are similar.
The difference between challenge-TE-2.wav and challenge.wav is audible, but only discoverable with threshold>=0.99.
The question is whether to accept these as similar. They certainly are similar, but this test file represents a
loss of quality, and if we accept this loss of quality in a migration once, what happens if this file is migrated
50 times? So perhaps the default threshold should be 0.99?

*And then there is challenge-KFC-3.wav. The difference here is certainly audible, and the test file sounds
awful. The waveform-compare tool however only compares one channel (default channel 0) and outputs success
with offset 0. If waveform-compare is set to compare channel 1, it again outputs success, but this time with
offset 3959. This suggest that the tool should be run on both (all) channels, and the offsets compared.

##Sound file attribution and provenance

All sound files are derived from a snippet of a Danish Radio P3 broadcast from TODO when

##License
TODO license.

##Funding
This work was partially supported by the [SCAPE](http://www.scape-project.eu/) Project. The SCAPE project is co-funded by the European Union under FP7 ICT-2009.4.1 (Grant Agreement number 270137).
